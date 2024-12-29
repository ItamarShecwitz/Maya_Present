extends Node2D
@onready var main_scene: Node2D = $".."
@onready var window : Window = get_window()	

var posVector: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Vector2(175, window.size.y - 175)
