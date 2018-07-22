extends "res://addons/net.kivano.fsm/content/FSMState.gd";

var me
var attacking
var steering

func stateInit(inParam1=null,inParam2=null,inParam3=null,inParam4=null, inParam5=null): 
	pass

func enter(fromStateID=null, fromTransitionID=null, inArg0=null,inArg1=null, inArg2=null):
	me = logicRoot.me
	attacking = logicRoot.attacking
	steering = logicRoot.steering
	
	me.aim()
	$AimTimer.start()

func update(deltaTime, param0=null, param1=null, param2=null, param3=null, param4=null):
	_follow_if_too_far()
	attacking.aim_at_target()

func exit(toState=null):
	me.unaim()

func _follow_if_too_far():
	if not attacking.near_target():
		_follow_target()
	if attacking.target_just_shot() and attacking.near_target():
		steering.rotated = true
	else: steering.rotated = false

func _follow_target():
	var angle = attacking.angle_to_target()
	logicRoot.steering.set_direction_from_angle(angle)

func _on_AimTimer_timeout():
	if attacking.ray_hit_target() and attacking.near_target():
		me.shoot()
	else: $AimTimer.start()