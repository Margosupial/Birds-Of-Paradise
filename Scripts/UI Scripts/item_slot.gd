extends Control
class_name Item_Slot

@onready var item_count_label: Label = $"PanelContainer/Item Count"
@onready var item_texture_button: TextureButton = $"PanelContainer/Item Texture"

@export var slot_data : Slot_Data : set = _update_slot_data

	
func _update_slot_data(new_slot_data : Slot_Data):
	item_count_label.text = str(new_slot_data.quantity)
	item_texture_button.texture_normal = new_slot_data.item_data.item_texture
