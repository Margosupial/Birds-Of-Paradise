@tool
extends Resource
class_name Inventory_Data

@export var slots : Array[ Slot_Data ]
@export var inventory_size : int : set = _update_size

func _update_size(value : int) -> void:
	inventory_size = value
	var diff = inventory_size - slots.size()
	if diff > 0:
		for i in diff:
			var new_slot = Slot_Data.new()
			new_slot.changed.connect( slot_changed )
			slots.append(new_slot)

func add_item( item : Item, count : int = 1) -> bool:
	for slot in slots:
		if slot:
			if slot.item_data == item:
				slot.quantity += count
				return true
	for i in slots.size():
		if slots[ i ] == null:
			continue
		elif slots[ i ].item_data == null:
			var new_slot = Slot_Data.new()
			new_slot.item_data = item
			new_slot.quantity = count
			slots[ i ] = new_slot
			new_slot.changed.connect( slot_changed )
			return true
	
	print("Inventory Full")
	return false

func connect_slots() -> void:
	for slot in slots:
		if slot:
			slot.changed.connect( slot_changed )

func slot_changed() -> void:
	for s in slots:
		if s:
			if s.quantity < 1:
				s.changed.disconnect( slot_changed )
				var index = slots.find(s)
				slots[ index ] = null
				emit_changed()
	pass

func get_save_data() -> Array:
	var item_save : Array = []
	for i in slots.size():
		item_save.append( item_to_save( slots[i] ) )
	return item_save

func item_to_save( slot : Slot_Data ) -> Dictionary:
	var result = { path = "", quantity = 0 }
	if slot != null:
		result.quantity = slot.quantity
		if slot.item_data != null:
			result.path = slot.item_data.resource_path
	return result

func parse_saved_data( save_data : Array ) -> void:
	var array_size = slots.size()
	slots.clear()
	slots.resize( array_size )
	for i in save_data.size():
		slots[ i ] = item_from_save( save_data[ i ] )
	connect_slots()


func item_from_save( save_dict : Dictionary ) -> Slot_Data:
	var new_slot : Slot_Data = Slot_Data.new()
	if save_dict.path != "":
		new_slot.item_data = load( save_dict.path )
		new_slot.quantity = int( save_dict.quantity )
	return new_slot
