tool
extends "res://addons/net.kivano.fsm/content/FSMTransition.gd";

var target_killed = false

func transitionInit(inParam1=null, inParam2=null, inParam3=null, inParam4=null, inParam5=null): 
	logicRoot.attacking.connect('target_killed', self, '_on_target_killed')

func prepare(inNewStateID, inArg0 = null, inArg1 = null, inArg2 = null): 
	target_killed = false

func _on_target_killed():
	target_killed = true

func transitionCondition(inDeltaTime, inParam0=null, inParam1=null, inParam2=null, inParam3=null, inParam4=null): 
	return target_killed