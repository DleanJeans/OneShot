extends Node

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen

func _ready():
	randomize()
	$Mechanics/ShrinkingCircle.start()
	yield(get_tree().create_timer(0.1), 'timeout')
	get_tree().paused = true
	yield(get_tree().create_timer(1), 'timeout')
	get_tree().paused = false