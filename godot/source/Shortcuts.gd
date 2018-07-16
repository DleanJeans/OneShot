extends Node

var game setget , get_game
func get_game():
	return $"/root/Game"

var world setget , get_world
func get_world():
	return $"/root/Game/World"

var mechanics setget , get_mechanics
func get_mechanics():
	return $"/root/Game/Mechanics"

var ui setget , get_ui
func get_ui():
	return $"/root/Game/UI"