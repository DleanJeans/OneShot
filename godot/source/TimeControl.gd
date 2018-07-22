extends Node

func _input(event):
	if Input.is_key_pressed(KEY_QUOTELEFT):
		Engine.time_scale = 0.1
	elif Input.is_key_pressed(KEY_1):
		Engine.time_scale = 1
	elif Input.is_key_pressed(KEY_2):
		Engine.time_scale = 2
	elif Input.is_key_pressed(KEY_3):
		Engine.time_scale = 3
	elif Input.is_key_pressed(KEY_4):
		Engine.time_scale = 4
