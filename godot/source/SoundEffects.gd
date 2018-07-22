extends Node2D

onready var player = get_parent()

func play_footstep_grass():
	if $FootstepGrass.playing: return
	$FootstepGrass.play()

func stop_footstep_grass():
	$FootstepGrass.stop()

func play_gunshot():
	$Gunshot.play()

func play_ammo_pickup():
	$AmmoPickup.play()

func play_empty_gun():
	if player.name == 'Player':
		$EmptyGun.play()