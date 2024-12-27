class_name Player extends CharacterBody2D
@onready var joy_stick: Node2D = $"../JoyStick"


const SPEED = 300.0
#const SPEED = 1
func _ready() -> void:
	global_position = Vector2(DisplayServer.screen_get_size().x/2, DisplayServer.screen_get_size().y/2)
	
	
func _process( delta ):
	
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	if joy_stick.posVector != Vector2(0,0):
		direction.x = joy_stick.posVector.x
		direction.y = joy_stick.posVector.y
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	move_and_slide()
