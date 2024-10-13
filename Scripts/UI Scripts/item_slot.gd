extends Button
class_name Item_Slot

@onready var item_count: Label = $"PanelContainer/Item Count"
@onready var item_texture: TextureRect = $"PanelContainer/Item Texture"


@export var slot_data : Slot_Data : set = _update_slot_data

func _ready() -> void:
	item_texture.texture = null
	item_count.text = ""
	
func _update_slot_data( value : Slot_Data ) -> void:
	slot_data = value
	if slot_data == null:
		return
	item_texture.texture = slot_data.item_data.item_texture
	item_count.text = str( slot_data.quantity)
 
