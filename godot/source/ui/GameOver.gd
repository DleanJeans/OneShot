extends Control

export(NodePath) var players

onready var _players = get_node(players)

func show():
	var num_players = _players.get_children().size()
	if num_players == 1: return
	
	$Winner.hide()
	$Placement.text = 'You placed\n#' + str(num_players)
	
	.show()

func show_for_winner():
	$Winner.show()
	$Placement.text = 'You placed #1'
	.show()

func _ready():
	hide()