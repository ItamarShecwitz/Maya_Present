extends CanvasLayer
@onready var text_box_container: MarginContainer = $TextBoxContainer
@onready var label: Label = $TextBoxContainer/Panel/MarginContainer/HBoxContainer/Label
@onready var margin_container: MarginContainer = $TextBoxContainer/Panel/MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.custom_minimum_size.x = margin_container.size.x
	label.custom_minimum_size.x = margin_container.size.y
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_text(text: String):
	label.text = text

func hide_textbox():
	text_box_container.hide()
	
func show_textbox():
	text_box_container.show()
