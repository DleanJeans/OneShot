extends Node

export(NodePath) var tile_map
export(NodePath) var shrinking_circle

onready var _tilemap = get_node(tile_map)
onready var _circle = get_node(shrinking_circle)

func get_random_position_in_rect():
	var rect = _tilemap.rect
	
	var x = rand_range(rect.position.x, rect.end.x)
	var y = rand_range(rect.position.y, rect.end.y)
	
	return Vector2(x, y)

func get_random_position_in_circle():
	var distance_from_center = rand_range(0, _circle.initial_radius * 1)
	var angle = rand_range(-PI, PI)
	
	return Vector2(distance_from_center, 0).rotated(angle)

func populate():
	$PlayerSpawner.populate()
	$TreeSpawner.populate()