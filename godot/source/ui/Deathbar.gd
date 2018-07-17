extends Control

export(NodePath) var player
export(NodePath) var death_mechanic

onready var _player = get_node(player)
onready var _death = get_node(death_mechanic)

var _health_record
var _rendering = false

onready var _latest_health = _death.max_health

func _ready():
	hide()

func start_rendering_if_is_player(player):
	if _is_player(player):
		_health_record = _death.get_record_for(_player)
		start_rendering()

func _is_player(player):
	return player == self._player

func start_rendering():
	_rendering = true
	show()

func stop_rendering_if_is_player(player):
	if _is_player(player):
		_rendering = false
		hide()

func process():
	if not _rendering: return
	
	var health = _health_record.health
	if health != _latest_health:
		$Tween.stop_all()
		$Tween.interpolate_property($ProgressBar, 'value', _latest_health, health, 0.5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
		$Tween.start()
	_latest_health = health