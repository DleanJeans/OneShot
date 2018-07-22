extends Node2D

signal target_killed

export(float) var enemy_distance = 500

onready var vision = get_parent().vision
onready var me = get_parent().me

var target_ref
var target

func target_just_shot():
	if _target_null() or target is Line2D: return false
	return target.just_shot()

func target_in_bullet_range():
	var bullet_range = 1000
	return target_in_range(bullet_range)

func near_target():
	return target_in_range(enemy_distance)

func target_in_range(the_range):
	if _target_null(): return false
	var distance_squared = target.position.distance_squared_to(global_position)
	return distance_squared < pow(the_range, 2)

func aim_at_target():
	var angle = angle_to_target()
	
	me.face_angle(angle)

func ray_hit_target():
	if _target_null(): return false
	
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(
	global_position, target.position, [self], me.collision_mask)
	
	return not result.empty()

func shoot():
	me.shoot()

func angle_to_target():
	_get_target_if_not_yet()
	if _target_null():
		return 0
	
	var target_position = target.position
	var position = me.position
	return target_position.angle_to_point(position)

func _target_null():
	return target == null or !target_ref.get_ref()

func _get_target_if_not_yet():
	if target == null and vision.see_enemies():
		target = vision.get_enemy()
		target_ref = weakref(target)
		if _target_null(): return
		_connect_target_killed()

func _connect_target_killed():
	if not target.is_connected('died', self, '_on_target_killed'):
		target.connect('died', self, '_on_target_killed')

func _on_target_killed():
	emit_signal('target_killed')
	vision.remove_enemy(target)
	
	target = null