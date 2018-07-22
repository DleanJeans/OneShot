extends Control

export(Color) var color
export(NodePath) var circle

onready var _player = get_parent()
onready var _circle = get_node(circle)

func _process(delta):
	update()

func _draw():
	draw_line(_player.position, _circle.next_center, color)