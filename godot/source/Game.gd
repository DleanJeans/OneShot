extends Node

func _ready():
	randomize()
	$Mechanics/ShrinkingCircle.start()