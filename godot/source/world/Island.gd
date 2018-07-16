extends Node2D

export(bool) var drawing = false
export(NodePath) var shrinking_circle
export(Color) var color

onready var _circle = get_node(shrinking_circle) 

func _ready():
	_circle.connect('started_rising', self, '_drawing_on')
	_circle.connect('started_waiting', self, '_drawing_off')

func _drawing_on():
	drawing = true

func _drawing_off():
	drawing = false

func _process(delta):
	if drawing:
		update()

func _draw():
	draw_circle(_circle.center, _circle.radius, color)