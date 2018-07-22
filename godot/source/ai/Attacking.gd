extends Node2D

signal target_killed

onready var vision = get_parent().vision
onready var me = get_parent().me

var target

func aim_at_target():
	var angle = angle_to_target()
	
	me.face_angle(angle)

func ray_hit_target():
	if target == null: return false
	
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(
	global_position, target.position, [self], me.collision_mask)
	
	return not result.empty()

func shoot():
	me.shoot()

func angle_to_target():
	_get_target_if_not_yet()
	if target == null: return 0
	
	var target_position = target.position
	var position = me.position
	return target_position.angle_to_point(position)

func _get_target_if_not_yet():
	if target == null and vision.see_enemies():
		vision.print_enemies()
		target = vision.get_enemy()
		_connect_target_killed()

func _connect_target_killed():
	if not target.is_connected('died', self, '_on_target_killed'):
		target.connect('died', self, '_on_target_killed')

func _on_target_killed():
	emit_signal('target_killed')
	vision.print_enemies()
	#print('Killed %s' % target.name)
	vision.remove_enemy(target)
	vision.print_enemies()
	
	target = null