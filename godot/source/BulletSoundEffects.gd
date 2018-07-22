extends Node2D

func play_hit_player():
	$HitPlayer.play()

func play_hit_wood():
	var num = randi() % 2 + 1
	var name = 'HitWood/%s' % num
	get_node(name).play()

func play_whiz():
	var num = randi() % 3 + 1
	var name = 'Whiz/%s' % num
	get_node(name).play()