extends Node

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen

func _ready():
	randomize()
	Engine.time_scale = 1
	$Mechanics/ShrinkingCircle.start()