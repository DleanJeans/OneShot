extends Control

func _on_PlayButton_pressed():
	get_tree().change_scene('res://source/Game.tscn')

func toggle_fullscreen():
	OS.window_fullscreen = not OS.window_fullscreen