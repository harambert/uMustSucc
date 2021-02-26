extends KinematicBody2D

const MAXSPD = 10
onready var main = get_tree().current_scene
onready var player = main.player
var velo

func _ready():
	pass # Replace with function body.
	
func physics_process(delta):
	if player != null:
		pass
