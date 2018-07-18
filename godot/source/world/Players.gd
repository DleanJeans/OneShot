extends Node

export(NodePath) var bullets

onready var _bullets = get_node(bullets)

func add_bullet(bullet):
	_bullets.add_child(bullet)

func count():
	var num = get_children().size()
	if $Player.dead:
		num -= 1
	return num

func count_alive():
	return count() - 1