extends Node2D
@onready var window : Window = get_window()	
@onready var x_button: Node2D = $CanvasLayer/X_button
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var letter: Sprite2D = $CanvasLayer/letter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	x_button.global_position = Vector2(window.size.x - 175, 175)
	
	color_rect.anchor_left = 0
	color_rect.anchor_right = 1
	color_rect.anchor_top = 0
	color_rect.anchor_bottom = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_parent().prune_button()
