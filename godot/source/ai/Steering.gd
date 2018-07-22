extends Node2D

var direction = Vector2()

func change_random_direction():
	var angle = rand_range(-PI, PI)
	if direction != Vector2():
		var angle_to_center = get_parent().angle_to_center()
		angle = angle_to_center + angle * 0.5
	
	set_direction_from_angle(angle)

func set_direction_from_angle(radian):
	direction = Vector2(cos(radian), sin(radian))

func _physics_process(delta):
	_move_towards_direction()

func _move_towards_direction():
	var me = get_parent().me
	
	me.stop_moving()
	
	if direction.x < -0.5:
		me.move_left()
	elif direction.x > 0.5:
		me.move_right()
	
	if direction.y < -0.5:
		me.move_up()
	elif direction.y > 0.5:
		me.move_down()