class_name UI_Window
extends CanvasLayer


@export var input : StringName = ""
@export var exit_button : UI_Exit_Button


func _ready() -> void:
	initialize_window()

func initialize_window() -> void:
	_assign_exit_button()
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(input):
		_toggle_visible()


func _toggle_visible():
	self.visible = not self.visible


func _assign_exit_button() -> void:
	if exit_button != null:
		exit_button.parent_window = self
	pass
