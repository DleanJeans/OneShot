extends Node

onready var death = $'../..'

onready var max_health = death.max_health
onready var health = max_health
var player
var outside = true

func process():
	if outside:
		_take_damage()
	else:
		_regenerate()

func _take_damage():
	health -= death.ocean_damage
	if health <= 0:
		death._died(player)
		queue_free()
		get_parent().remove_child(self)

func _regenerate():
	health += death.regenerate
	if health > max_health:
		health = max_health
		death._max_health(player)
		queue_free()