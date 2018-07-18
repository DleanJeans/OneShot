extends Node

export(NodePath) var loots

onready var _loots = get_node(loots)

var _player

func drop_loots(player):
	_player = player
	_drop_bullets()

var BulletLootScene = load('res://source/world/BulletLoot.tscn')

func _drop_bullets():
	var bullet_count = _player.bullet_count
	if bullet_count <= 0: return
	
	var bullet_loot = BulletLootScene.instance()
	bullet_loot.dropper = _player
	bullet_loot.amount = bullet_count
	bullet_loot.position = _player.position
	_loots.add_child(bullet_loot)