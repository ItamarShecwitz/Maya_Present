extends Node2D
var popUpScene
var popUp
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popUpScene = preload("res://text_box.tscn")
	popUp = popUpScene.instantiate()
	add_child(popUp)
	popUp.hide_textbox()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
