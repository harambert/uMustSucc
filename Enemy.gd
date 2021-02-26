extends KinematicBody2D

const MAXSPD = 10
onready var main: Node2D = get_tree().current_scene
onready var player: KinematicBody2D = main.player

func _ready():
	pass
	
func _physics_process(_delta):
	if player == null:
		return
	move_and_slide(position.direction_to(player.position) * 50, Vector2.UP)
