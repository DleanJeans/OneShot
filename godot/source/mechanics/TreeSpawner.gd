extends Node

var TreeScene = load("res://source/world/Tree.tscn")

export(int) var num_trees = 400
export(NodePath) var trees

onready var _trees = get_node(trees)

func populate():
	for i in range(0, num_trees):
		var min_dist
		var max_dist
		var percent = float(i) / num_trees
		
		if percent < 0.05:
			min_dist = 0
			max_dist = get_parent().radius_percent(0.2)
		else:
			min_dist = get_parent().radius_percent(0.2)
			max_dist = get_parent().radius_percent(1)
			
		var position = get_parent().random_position_circle(min_dist, max_dist)
		var tree = TreeScene.instance()
		var angle = rand_range(-PI, PI)
		
		tree.position = position
		tree.rotation = angle
		_trees.add_child(tree)
