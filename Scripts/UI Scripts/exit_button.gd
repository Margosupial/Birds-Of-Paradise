extends Control
class_name UI_Exit_Button

var parent_window : UI_Window

func close_window() -> void:
	parent_window.toggle_visible()


func _on_texture_button_pressed() -> void:
	close_window()
