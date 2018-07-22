extends Control

export(NodePath) var players

onready var _players = get_node(players)

func show():
	var player_count = _players.count()
	if player_count <= 1: return
	
	$Winner.hide()
	$Placement.text = 'You placed\n#' + str(player_count)
	
	.show()
	$AnimationPlayer.play('show')

func show_for_winner():
	$Winner.show()
	$Placement.text = 'You placed #1'
	$AnimationPlayer.play('show')
	.show()

func _ready():
	hide()

func _on_PlayAgainButton_pressed():
	get_tree().change_scene('res://source/TitleScreen.tscn')