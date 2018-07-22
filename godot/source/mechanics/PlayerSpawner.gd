extends Node

var PlayerScene = load("res://source/world/Player.tscn")
var BrainScene = load('res://source/ai/Brain.tscn')

export(int) var player_count = 99
export(NodePath) var players
export(NodePath) var player

onready var _players = get_node(players)
onready var _player = get_node(player)

func populate():
	var position = random_position()
	_player.position = position
	_player.show()
	
	for i in range(0, player_count):
		position = random_position()
		var player = PlayerScene.instance()
		var brain = BrainScene.instance()
		
		player.position = position
		player.add_child(brain)
		_players.add_child(player, true)

func random_position():
	var max_dist = get_parent().radius_percent(0.1)
	return get_parent().random_position_circle(0, max_dist)