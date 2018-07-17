extends Node

var PlayerScene = load("res://source/world/player/Player.tscn")

export(int) var num_players = 99
export(NodePath) var players

onready var _players = get_node(players)

func populate():
	for i in range(0, num_players):
		var position = get_parent().get_random_position_in_rect()
		var player = PlayerScene.instance()
		
		player.position = position
		_players.add_child(player, true)