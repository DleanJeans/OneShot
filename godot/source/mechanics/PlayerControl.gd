extends Node

export(NodePath) var player

onready var _player = get_node(player)

func _ready():
	if player == null:
		set_physics_process(false)

func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		_player.move_up()
	if Input.is_action_pressed("move_down"):
		_player.move_down()
	if Input.is_action_pressed("move_left"):
		_player.move_left()
	if Input.is_action_pressed("move_right"):
		_player.move_right()
		
	if Input.is_action_just_released("move_up"):
		_player.stop_moving()
	if Input.is_action_just_released("move_down"):
		_player.stop_moving()
	if Input.is_action_just_released("move_left"):
		_player.stop_moving()
	if Input.is_action_just_released("move_right"):
		_player.stop_moving()
