@tool
extends Node2D
class_name Item_Entity

@export var item_data : Item : set = _set_item_data


@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	_update_texture()
	if Engine.is_editor_hint():
		return
	area_2d.body_entered.connect( _on_body_entered )


func _on_body_entered(body) -> void:
	pass


func item_picked_up() -> void :
	pass


func _set_item_data(value : Item) -> void:
	item_data = value
	pass


func _update_texture() -> void:
	pass
