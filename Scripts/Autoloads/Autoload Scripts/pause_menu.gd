extends CanvasLayer

@onready var save_button: Button = $VBoxContainer/Save_Button
@onready var load_button: Button = $VBoxContainer/Load_Button
@onready var test_button: Button = $VBoxContainer/Test_Button



var is_paused : bool = false



func _ready() -> void:
	hide_menu()
	save_button.pressed.connect( _on_save_pressed )
	load_button.pressed.connect( _on_load_pressed )
	test_button.pressed.connect( _on_test_pressed )
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

func _on_test_pressed() -> void:
	LevelManager.ui_trigger_transition.emit()


func _on_save_pressed() -> void:
	if not is_paused:
		return
	SaveManager.save_game()
	hide_menu()
	pass

func _on_load_pressed() -> void:
	if not is_paused:
		return
	SaveManager.load_game()
	await LevelManager.level_load_started
	hide_menu()
	pass
