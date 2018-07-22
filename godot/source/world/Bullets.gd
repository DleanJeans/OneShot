extends Node

export(NodePath) var death

onready var _death = get_node(death)

func kill(player):
	_death.kill(player)