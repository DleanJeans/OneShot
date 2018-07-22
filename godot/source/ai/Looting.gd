extends Node2D

var bullet

func _on_Vision_saw_bullet(bullet):
	self.bullet = bullet

func angle_to_loot():
	if get_parent().vision.see_bullets():
		if bullet == null:
			bullet = get_parent().vision.get_bullet()
			bullet.connect('collected', self, '_on_bullet_collected')
	else: return 0
	
	var bullet_position = bullet.position
	return bullet_position.angle_to_point(global_position)

func _on_bullet_collected():
	bullet = null