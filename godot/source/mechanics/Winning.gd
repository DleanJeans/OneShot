extends Node

signal player_won

export(NodePath) var players
export(NodePath) var player

onready var _players = get_node(players)
onready var _player = get_node(player)

func check_for_winner(dead_player):
	var one_player_left = _players.get_children().size() - 1 == 1
	var dead_player_is_not_the_player = dead_player != _player
	
	if one_player_left and dead_player_is_not_the_player:
		emit_signal('player_won')