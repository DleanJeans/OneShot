extends Node

func animation_death(player):
	var animation = load('res://source/juice/DeathAnimation.tscn').instance()
	player.add_child(animation)
	animation.play('.')