extends Node

var TreeScene = load("res://source/world/Tree.tscn")

export(int) var num_trees = 100
export(NodePath) var trees

onready var _trees = get_node(trees)

func populate():
	for i in range(0, num_trees):
		var position = get_parent().get_random_position_in_circle()
		var tree = TreeScene.instance()
		var angle = rand_range(-PI, PI)
		
		tree.position = position
		tree.rotation = angle
		_trees.add_child(tree)