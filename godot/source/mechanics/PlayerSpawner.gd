extends Node

var PlayerScene = load("res://source/world/Player.tscn")
var BrainScene = load('res://source/ai/Brain.tscn')

export(int) var player_count = 99
export(NodePath) var players
export(NodePath) var player

onready var _players = get_node(players)
onready var _player = get_node(player)

func populate():
	var position = get_parent().get_random_position_in_rect()
	_player.position = position
	_player.show()
	
	for i in range(0, player_count):
		position = get_parent().get_random_position_in_rect()
		var player = PlayerScene.instance()
		var brain = BrainScene.instance()
		
		player.position = position
		player.add_child(brain)
		_players.add_child(player, true)