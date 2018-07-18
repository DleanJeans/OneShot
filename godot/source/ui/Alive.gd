extends Control

export(NodePath) var players

onready var _players = get_node(players)

func update(player):
	var player_count = _players.count_alive()
	$Number.text = str(player_count)