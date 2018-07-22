extends KinematicBody2D

signal died
signal shot_bullet
signal cannot_shoot
signal picked_up_bullet

export(float) var speed = 200

onready var velocity = Vector2()

var dead = false
var bullet_count = 3

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
	if bullet_count <= 0:
		emit_signal('cannot_shoot')
		return
	
	var bullet = BulletScene.instance()
	bullet.shoot(self)
	bullet_count -= 1
	get_parent().add_bullet(bullet)
	
	emit_signal('shot_bullet')