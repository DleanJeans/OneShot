extends Node

export(NodePath) var loots
onready var _loots = get_node(loots)

export(int) var amount = 50
export(int) var min_amount = 3
export(int) var max_amount = 5

var BulletLoot = load('res://source/world/BulletLoot.tscn')

func populate():
	for i in range(0, amount):
		var loot = BulletLoot.instance()
		
		var min_dist = get_parent().radius_percent(0.25)
		var max_dist = get_parent().radius_percent(0.75)
		
		var random_amount = randi() % (max_amount - min_amount + 1) + min_amount
		
		var position
		while true:
			position = get_parent().random_position_circle(min_dist, max_dist)
			loot.position = position
			if loot.get_overlapping_bodies().size() == 0:
				break
		
		loot.amount = random_amount
		
		_loots.add_child(loot)