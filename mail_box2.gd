extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exclamation: Sprite2D = $Exclamation

var letter
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("float")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	exclamation.hide()
	letter = preload("res://letter.tscn")
	letter = letter.instantiate()
	letter.set_texture("res://assets/Tiles/letter2.png")
	add_child(letter)

func prune_button() -> void:
	letter.queue_free()
