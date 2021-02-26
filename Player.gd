extends KinematicBody2D

const GRAV = 5
const MAXSPD = 50

var velo = Vector2.ZERO
var inputVector = Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velo.x = inputVector.x * MAXSPD
	move_and_slide(velo, Vector2.UP)
	if !is_on_floor():
		velo.y += GRAV
	if Input.is_action_just_pressed("ui_up"):
		velo.y = - 100