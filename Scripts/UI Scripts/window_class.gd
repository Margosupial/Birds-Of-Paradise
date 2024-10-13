class_name UI_Window
extends CanvasLayer


@export var input : StringName = ""
@export var exit_button : UI_Exit_Button


func _ready() -> void:
	_assign_exit_button()
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(input):
		_toggle_visible()


func _toggle_visible():
	if self.visible == false:
		self.visible = true
	else:
		self.visible = false

func _assign_exit_button() -> void:
	if exit_button != null:
		exit_button.parent_window = self
	pass
