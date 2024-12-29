class_name Player extends CharacterBody2D
@onready var joy_stick: Node2D = $"../JoyStick"
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animations: AnimationPlayer = $Animations
var animation_direction  = "Idle"
var animation_state = "Front"

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
		


func _play_animations():
	
	var degree = int(fmod(rad_to_deg(velocity.angle()) + 360, 360) + 0.5)
	if velocity == Vector2.ZERO:
		animation_state = "Idle"
	else:
		animation_state = "Walk"
		if degree >= 45 and degree <= 135:
			animation_direction = "Front"
		elif degree > 135 and degree < 225:
			animation_direction = "Side"
		elif degree >= 225 and degree <= 315:
			animation_direction = "Back"
		elif degree > 315 or degree < 45:
			animation_direction = "RSide"
		
	
	animations.play(animation_state + animation_direction)
func _physics_process(delta: float) -> void:
	move_and_slide()
	_play_animations()
