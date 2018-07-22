extends Node2D

var bullet
var bullet_ref

func _on_Vision_saw_bullet(bullet):
	self.bullet = bullet

func angle_to_loot():
	if get_parent().vision.see_bullets():
		if _bullet_null():
			bullet = get_parent().vision.get_bullet()
			bullet_ref = weakref(bullet)
			bullet.connect('collected', self, '_on_bullet_collected')
	else: return 0
	
	var bullet_position = bullet.position
	return bullet_position.angle_to_point(global_position)

func _bullet_null():
	return bullet == null or not bullet_ref.get_ref()

func _on_bullet_collected():
	bullet = null