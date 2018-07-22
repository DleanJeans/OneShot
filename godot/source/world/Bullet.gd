extends Area2D

signal stopped

export(float) var speed = 2000
export(float) var shot_range = 1000

var velocity = Vector2(speed, 0)
var range_covered = 0
var shooter

onready var line = $Trail/Line
var stopped = false

var _initial_trail_angle_sign

func shoot(player):
	shooter = player
	global_position = player.global_position
	rotation = player.rotation
	velocity = velocity.rotated(rotation)
	
	_check_for_initial_collision()
	
func _check_for_initial_collision():
	var bodies = get_overlapping_bodies()
	if bodies.size() > 0:
		emit_signal('body_entered', bodies[0])

func _physics_process(delta):
	if not stopped:
		_move(delta)
		_stop_if_overrange(delta)
	
	_draw_trail()

func _move(delta):
	position += velocity * delta

func _stop_if_overrange(delta):
	var movement = speed * delta
	range_covered += movement
	
	if range_covered >= shot_range:
		stop()

func stop():
	stopped = true
	emit_signal('stopped')

func _draw_trail():
	if line.points.size() < 2:
		line.add_point(position)
	else:
		if stopped:
			_move_end_point()
			_free_if_trail_overlaps()
		else:
			_move_start_point()

func _move_end_point():
	line.points[0] += velocity * get_process_delta_time()

func _move_start_point():
	line.points[0] += velocity * get_process_delta_time() * 0.25
	line.points[1] = position

func _free_if_trail_overlaps():
	var trail_angle = _compute_trail_angle()
	if sign(trail_angle) != sign(rotation):
		queue_free()

func _compute_trail_angle():
	var trail_vector = line.points[1] - line.points[0]
	var angle = trail_vector.angle_to_point(Vector2())
	return angle

func _on_hit(body):
	if body != shooter:
		stop()
		if body is load('res://source/world/Player.gd'):
			get_parent().kill(body)