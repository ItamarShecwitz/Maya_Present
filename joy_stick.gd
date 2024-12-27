extends Node2D

var posVector: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Vector2(DisplayServer.screen_get_size().x / 10, 8 * DisplayServer.screen_get_size().y / 10)
