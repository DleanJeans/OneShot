tool
extends "res://addons/net.kivano.fsm/content/FSMTransition.gd";

func transitionInit(inParam1=null, inParam2=null, inParam3=null, inParam4=null, inParam5=null): 
	pass

func prepare(inNewStateID, inArg0 = null, inArg1 = null, inArg2 = null):
	pass

func transitionCondition(inDeltaTime, inParam0=null, inParam1=null, inParam2=null, inParam3=null, inParam4=null): 
	return logicRoot.vision.see_bullets()