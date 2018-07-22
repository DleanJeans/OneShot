extends Node2D

export(NodePath) var circle
export(float) var distance_threshold = 200

onready var _circle = get_node(circle)
onready var me = get_parent() setget , get_me
func get_me(): return get_parent()

onready var vision = $Vision setget , get_vision
func get_vision(): return $Vision

onready var steering = $Steering setget , get_steering
func get_steering(): return $Steering

onready var attacking = $Attacking setget , get_attacking
func get_attacking(): return $Attacking

onready var looting = $Looting setget , get_looting
func get_looting(): return $Looting

func near_sea():
	var radius = _circle.radius
	var center = _circle.center
	var position = me.position
	
	var distance_to_center = position.distance_to(center)
	var distance_to_sea = radius - distance_to_center
	
	return distance_to_sea < distance_threshold

func sea_rising():
	return _circle.is_closing_in()

func angle_to_center():
	var center = _circle.center
	var position = me.position
	var vector = center - position
	
	return vector.angle_to_point(Vector2())

func _on_FSM_stateChanged(newStateID, oldStateID):
	#print('FSM: %s -> %s' % [oldStateID, newStateID])
	pass