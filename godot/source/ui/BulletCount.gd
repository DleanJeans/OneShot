extends Control

export(NodePath) var player

onready var _player = get_node(player)

func _ready():
	update()

func update():
	var count = _player.bullet_count
	$Count.text = str(count)