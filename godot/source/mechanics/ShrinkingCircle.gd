extends Node

signal started_waiting
signal started_rising

export(PoolIntArray) onready var wait_times = [30, 25, 20, 15, 10, 5]
export(PoolIntArray) onready var rise_times = [10, 10, 10, 5, 5, 5]

export(float) var initial_radius = 4000
export(float) var shrink_percent = 0.6

onready var radius = initial_radius

var center = Vector2()
var next_radius
var next_center = Vector2()

var current_rise
var rise_time
var time setget , get_time

func get_time():
	var the_time = 0
	if $WaitTimer.time_left > 0:
		the_time = $WaitTimer.time_left
	else:
		the_time = $RiseTimer.time_left
	
	return round(the_time)

func is_closing_in():
	return $RiseTimer.time_left > 0

func stop():
	$Tween.stop_all()
	$WaitTimer.stop()
	$RiseTimer.stop()

func start():
	current_rise = 0
	
	while current_rise < wait_times.size() - 1:
		_start_next_rise()
		yield($Tween, 'tween_completed')
		$Tween.stop_all()
		current_rise += 1
	
	_start_last_rise()

func _start_next_rise():
	_get_parameters()
	_setup_tween()
	_wait()

func _wait():
	$WaitTimer.wait_time = wait_times[current_rise]
	$WaitTimer.start()
	emit_signal('started_waiting')

func _get_parameters():
	rise_time = rise_times[current_rise]
	next_radius = radius * shrink_percent
	
	var random_angle = rand_range(-PI, PI)
	var random_displacement = rand_range(0, radius - next_radius)
	var vector = Vector2(random_displacement, 0).rotated(random_angle)
	
	next_center = center + vector

func _setup_tween():
	$Tween.interpolate_property(self, "radius", radius, next_radius, rise_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property(self, "center", center, next_center, rise_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$RiseTimer.wait_time = rise_time

func _start_last_rise():
	_get_parameters()
	next_radius = 0
	_wait()
	_setup_tween()

func _on_WaitTimer_timeout():
	$Tween.start()
	$RiseTimer.start()
	emit_signal('started_rising')