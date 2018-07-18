extends Node

signal player_won
signal game_over

export(NodePath) var players
export(NodePath) var player

onready var _players = get_node(players)
onready var _player = get_node(player)

func check_for_winner(dead_player):
	var num_players = _players.get_children().size()
	if _player.dead:
		num_players -= 1
	
	var one_player_left = num_players - 1 == 1
	var dead_player_is_not_the_player = dead_player != _player
	var player_not_dead = not _player.dead
	
	if one_player_left \
	and dead_player_is_not_the_player \
	and player_not_dead:
		emit_signal('player_won')
	
	if one_player_left:
		emit_signal('game_over')