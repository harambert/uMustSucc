extends KinematicBody2D

const MAXSPD: float = 20.0
const ACC: float = 0.3

onready var main: Node2D = get_tree().current_scene
onready var player: KinematicBody2D = main.find_node("Player")

var velo: Vector2 = Vector2(0,0)

func _ready():
	velo = position.direction_to(player.position)
	
func _physics_process(_delta):
	velo = (velo + position.direction_to(player.position) * ACC).clamped(MAXSPD)
	move_and_slide(velo, Vector2.UP)
