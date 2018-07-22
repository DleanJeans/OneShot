extends "res://addons/net.kivano.fsm/content/FSMState.gd";

func get_fsm(): return fsm;
func get_logic_root(): return logicRoot;

func stateInit(inParam1=null,inParam2=null,inParam3=null,inParam4=null, inParam5=null): 
	pass

func enter(fromStateID=null, fromTransitionID=null, inArg0=null,inArg1=null, inArg2=null):
	_change_direction_to_center()

func update(deltaTime, param0=null, param1=null, param2=null, param3=null, param4=null):
	pass

func exit(toState=null):
	pass

func _change_direction_to_center():
	var angle_to_center =  get_logic_root().angle_to_center()
	get_logic_root().steering.set_direction_from_angle(angle_to_center)