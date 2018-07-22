extends Area2D

export(float) var reaction_time = 0.5

var enemies = []
var bullets_on_screen = []

func see_enemies():
	return enemies.size() > 0

func see_bullets():
	return bullets_on_screen.size() > 0

func get_bullet():
	return bullets_on_screen[0]

func get_enemy():
	var random_index = randi() % enemies.size()
	return enemies[random_index]

func remove_enemy(e):
	enemies.erase(e)

func _process(delta):
	rotation = -get_parent().me.rotation
	_update_enemies_on_screen()
	_update_bullets_on_screen()

func _update_enemies_on_screen():
	var enemies_on_screen = get_overlapping_bodies()
	for e in enemies_on_screen:
		if _filter_enemy(e):
			enemies.append(e)

func _filter_enemy(e):
	var not_me = e != get_parent().me
	var not_added = enemies.find(e) == -1
	var not_dead = not e.dead
	
	return not_me and not_added and not_dead

func _update_bullets_on_screen():
	bullets_on_screen = get_overlapping_areas()