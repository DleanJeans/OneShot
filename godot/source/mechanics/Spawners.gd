extends Node

export(NodePath) var tile_map
export(NodePath) var shrinking_circle

onready var _tilemap = get_node(tile_map)
onready var _circle = get_node(shrinking_circle)

func random_position_circle(min_dist, max_dist = -1):
	if max_dist == -1:
		max_dist = _circle.initial_radius
	var distance_from_center = rand_range(min_dist, max_dist)
	var angle = rand_range(-PI, PI)
	
	return Vector2(distance_from_center, 0).rotated(angle)

func radius_percent(percent):
	return _circle.initial_radius * percent

func populate():
	$PlayerSpawner.populate()
	$TreeSpawner.populate()
	$LootSpawner.populate()