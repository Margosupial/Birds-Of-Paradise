extends Resource
class_name Inventory_Data

@export var slots : Array[ Slot_Data ]


func add_item( item : Item, count : int = 1) -> bool:
	for slot in slots:
		if slot:
			if slot.item_data == item:
				slot.quantity += count
				return true
	for i in slots.size():
		if slots[ i ] == null:
			var new_slot = Slot_Data.new()
			new_slot.item_data = item
			new_slot.quantity = count
			slots[ i ] = new_slot
			return true
	
	print("Inventory Full")
	return false
