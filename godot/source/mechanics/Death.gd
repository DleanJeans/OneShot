extends Node

signal added_to_record(player)
signal process_step

signal max_health(player)
signal died(player)

var HealthRecordClass = load('res://source/mechanics/HealthRecord.gd')

export(float) var process_interval = 1

export(float) var max_health = 100
export(float) var ocean_damage_per_sec = 10
export(float) var regenerate_per_sec = 2

export(NodePath) var shrinking_circle
export(NodePath) var players

onready var _circle = get_node(shrinking_circle)
onready var _players = get_node(players)

func get_ocean_damage():
	return ocean_damage_per_sec * process_interval

func get_regenerate():
	return regenerate_per_sec * process_interval

func stop():
	$ProcessTimer.stop()

func _ready():
	$ProcessTimer.wait_time = process_interval
	$ProcessTimer.start()

func get_record_for(player):
	return $Records.get_node(player.name)

func _on_ProcessTimer_timeout():
	process()

func process():
	_update_health_records()
	_process_health_records()

func _update_health_records():
	var health_record
	
	for player in _get_players():
		if player.dead: continue
		
		if _record_exists_for(player):
			health_record = get_record_for(player)
			health_record.outside = _player_outside_circle(player)
		elif _player_outside_circle(player):
			health_record = HealthRecordClass.new()
			health_record.player = player
			health_record.name = player.name
			$Records.add_child(health_record)
			emit_signal('added_to_record', player)

func _get_players():
	return _players.get_children()

func _record_exists_for(player):
	return $Records.has_node(player.name)

func _process_health_records():
	for record in $Records.get_children():
		record.process()
	emit_signal('process_step')

func _player_outside_circle(player):
	var distance_to_center = player.position.distance_squared_to(_circle.center)
	var circle_radius = pow(_circle.radius, 2)
	
	return distance_to_center > circle_radius

func _died(player):
	player.die()
	emit_signal('died', player)

func _max_health(player):
	emit_signal('max_health', player)