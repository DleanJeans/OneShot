extends Node

export(NodePath) var tilemap
export(float) var player_half_size = 20
export(String) var player_group_name = "Players"

onready var _tilemap = get_node(tilemap)

func _physics_process(delta):
	var map_size = _tilemap.map_size.x
	var half_size = map_size * 0.5
	
	for player in _get_players():
		if player.position.x - player_half_size <= -half_size:
			player.position.x = -half_size + player_half_size
		if player.position.x + player_half_size >= half_size:
			player.position.x = half_size - player_half_size
			
		if player.position.y - player_half_size <= -half_size:
			player.position.y = -half_size + player_half_size
		if player.position.y + player_half_size >= half_size:
			player.position.y = half_size - player_half_size

func _get_players():
	return get_tree().get_nodes_in_group(player_group_name)