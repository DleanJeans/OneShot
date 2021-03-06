extends Node

onready var death = $'../..'

onready var max_health = death.max_health
onready var health = max_health
var player
var outside = true

func process():
	if player.dead:
		queue_free()
		return
	
	if outside:
		_take_damage()
	else:
		_regenerate()

func _take_damage():
	health -= death.get_ocean_damage()
	if health <= 0:
		death.kill(player)
		queue_free()

func queue_free():
	.queue_free()
	get_parent().remove_child(self)

func _regenerate():
	health += death.get_regenerate()
	if health > max_health:
		health = max_health
		death._max_health(player)
		queue_free()