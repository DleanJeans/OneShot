extends Node

signal player_won
signal game_over

export(NodePath) var players
export(NodePath) var player

onready var _players = get_node(players)
onready var _player = get_node(player)

func check_for_winner():
	var player_count = _players.count_alive()
	
	var one_player_left = player_count <= 1
	var player_not_dead = not _player.dead
	
	if one_player_left and player_not_dead:
		emit_signal('player_won')
	
	if one_player_left:
		emit_signal('game_over')
		$CheckTimer.stop()