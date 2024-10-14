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
	if body is Player:
		if item_data:
			if PlayerManager.INVENTORY_DATA.add_item( item_data ):
				item_picked_up()
	pass


func item_picked_up() -> void :
	area_2d.body_entered.disconnect( _on_body_entered )
	visible = false
	queue_free()
	pass


func _set_item_data(value : Item) -> void:
	item_data = value
	_update_texture()
	pass


func _update_texture() -> void:
	if item_data and sprite_2d:
		sprite_2d.texture = item_data.entity_texture
	pass
