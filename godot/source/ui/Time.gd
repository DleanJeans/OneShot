extends Control

export(NodePath) var shrinking_circle

onready var _circle = get_node(shrinking_circle)

func _process(delta):
	$Label.text = str(_circle.time)