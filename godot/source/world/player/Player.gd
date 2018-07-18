extends KinematicBody2D

signal died

export(float) var speed = 200

onready var velocity = Vector2()

var dead = false

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
