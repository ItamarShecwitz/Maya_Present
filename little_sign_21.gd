extends Node2D
@onready var player: Player = $"../../Player"

var popUpScene
var popUp
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popUpScene = preload("res://text_box.tscn")
	popUp = popUpScene.instantiate()
	add_child(popUp)
	popUp.set_text("אני אוהב את הדייט השני שלנו!")
	popUp.hide_textbox()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		popUp.show_textbox()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		popUp.hide_textbox()
