extends Resource
class_name Slot_Data

@export var item_data: Item
@export var quantity: int = 0 : set = set_quantity


func set_quantity( value ) -> void:
	quantity = value
	if quantity < 1:
		emit_changed()
