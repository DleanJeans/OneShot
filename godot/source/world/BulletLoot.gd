extends Area2D

signal collected

export(int) var amount = 1

var PlayerClass = load('res://source/world/Player.gd')
var dropper

func _on_body_entered(body):
	if body is PlayerClass and body != dropper:
		collect_by(body)

func collect_by(player):
	player.pick_up_bullet(amount)
	queue_free()
	emit_signal('collected')