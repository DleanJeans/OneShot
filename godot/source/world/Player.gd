extends KinematicBody2D

signal died
signal shot_bullet
signal cannot_shoot
signal picked_up_bullet

export(float) var speed = 200

onready var velocity = Vector2()

var dead = false
var bullet
var bullet_count = 0

func target_is(player):
	if not has_node('Brain'): return false
	var attacking = $'Brain/Attacking'
	var target = attacking.target
	return target == player

func just_shot():
	return bullet != null

func gun_cooled_down():
	return $GunCooldownTimer.time_left == 0

func has_bullets():
	return bullet_count > 0

func pick_up_bullet(amount):
	bullet_count += amount
	emit_signal('picked_up_bullet')

func queue_free():
	if name == 'Player':
		hide()
	else: .queue_free()

func die():
	dead = true
	collision_layer = 0
	collision_mask = 0
	emit_signal('died')

func move_up():
	if velocity.y == speed:
		velocity.y = 0
	else: velocity.y = -speed

func move_down():
	if velocity.y == -speed:
		velocity.y = 0
	else: velocity.y = speed

func move_left():
	if velocity.x == speed:
		velocity.x = 0
	else: velocity.x = -speed

func move_right():
	if velocity.x == -speed:
		velocity.x = 0
	else: velocity.x = speed

func stop_moving():
	velocity = Vector2()

func _physics_process(delta):
	velocity = velocity.clamped(speed)
	move_and_slide(velocity)

func aim():
	$Gun.show()

func unaim():
	$Gun.hide()

func face_angle(angle):
	rotation = angle

var BulletScene = load('res://source/world/Bullet.tscn')

func shoot():
	if bullet_count <= 0 or not gun_cooled_down():
		emit_signal('cannot_shoot')
		return
	
	bullet = BulletScene.instance()
	bullet.shoot(self)
	bullet_count -= 1
	bullet.connect('stopped', self, '_remove_bullet_ref')
	get_parent().add_bullet(bullet)
	$GunCooldownTimer.start()
	
	emit_signal('shot_bullet')

func _remove_bullet_ref():
	bullet = null