extends KinematicBody2D

const GRAV = 5
const MAXSPD = 60

var velo = Vector2.ZERO
var inputVector = Vector2.ZERO

onready var sprite = $Sprite
onready var animation = $AnimationPlayer

func _ready():
	pass
	
func _physics_process(delta):
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velo.x = inputVector.x * MAXSPD
	move_and_slide(velo, Vector2.UP)
	if !is_on_floor():
		velo.y += GRAV
		animation.play("Jump")
	elif inputVector.x == 0:
		animation.play("Idle")
	else:
		animation.play("Run")
	
	if is_on_floor():
		velo.y = 10
		if Input.is_action_just_pressed("ui_up"):
			velo.y = -125
	
	if inputVector.x > 0:
		sprite.flip_h = false
	if inputVector.x < 0:
		sprite.flip_h = true
	
