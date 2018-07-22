extends "res://addons/net.kivano.fsm/content/FSMState.gd";


func stateInit(inParam1=null,inParam2=null,inParam3=null,inParam4=null, inParam5=null): 
	pass

func enter(fromStateID=null, fromTransitionID=null, inArg0=null,inArg1=null, inArg2=null):
	pass

func update(deltaTime, param0=null, param1=null, param2=null, param3=null, param4=null):
	_go_to_bullet()

func exit(toState=null):
	logicRoot.vision.enemies = []

func _go_to_bullet():
	var angle = logicRoot.looting.angle_to_loot()
	logicRoot.steering.set_direction_from_angle(angle)