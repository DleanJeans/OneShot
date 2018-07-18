extends Area2D

export(int) var amount = 1

var PlayerClass = load('res://source/world/player/Player.gd')
var dropper

func _on_body_entered(body):
	if body is PlayerClass and body != dropper:
		pick_up_by(body)

func pick_up_by(player):
	player.pick_up_bullet()
	queue_free()