extends CanvasLayer

@onready var save_button: Button = $VBoxContainer/Save_Button
@onready var load_button: Button = $VBoxContainer/Load_Button



var is_paused : bool = false



func _ready() -> void:
	hide_menu()
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Input_Menu"):
		if is_paused == false:
			show_menu()
		else:
			hide_menu()
		get_viewport().set_input_as_handled()

func show_menu() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true

func hide_menu() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
