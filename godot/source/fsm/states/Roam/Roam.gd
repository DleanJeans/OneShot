extends "res://addons/net.kivano.fsm/content/FSMState.gd";

export(int) var change_direction_cooldown = 1

var _stop_changing_direction = false

func stateInit(inParam1=null,inParam2=null,inParam3=null,inParam4=null, inParam5=null): 
	logicRoot.steering.change_random_direction()

func enter(fromStateID=null, fromTransitionID=null, inArg0=null,inArg1=null, inArg2=null):
	pass

func update(deltaTime, param0=null, param1=null, param2=null, param3=null, param4=null):
	_change_direction_if_near_sea()

func exit(toState=null):
	pass

func _change_direction_if_near_sea():
	if _stop_changing_direction:
		return
	
	if logicRoot.near_sea():
		_change_direction()
		_delay_changing_again()

func _change_direction():
	logicRoot.steering.change_random_direction()

func _delay_changing_again():
	_stop_changing_direction = true
	yield(get_tree().create_timer(change_direction_cooldown), 'timeout')
	_stop_changing_direction = false