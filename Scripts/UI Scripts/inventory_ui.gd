extends UI_Window
class_name Inventory_UI

const INVENTORY_SLOT = preload("res://UI Elements/UI Subelements/item_slot.tscn")

@onready var item_slot_grid: GridContainer = $Control/PanelContainer/PanelContainer/HBoxContainer/VBoxContainer/ItemSlotGrid

@export var inventory_size : int = 5
@export var inventory : Inventory_Data 

var inventory_grid : Array[ Item_Slot ]


func _ready() -> void:
	assign_exit_button()
	generate_inventory_slots()
	update_inventory()
	pass

func generate_inventory_slots() -> void:
	inventory_grid = []
	for x in inventory_size:
		var new_slot : Item_Slot = INVENTORY_SLOT.instantiate()
		inventory_grid.append(new_slot)
		item_slot_grid.add_child(new_slot)
	pass

func update_inventory() -> void:
	if inventory != null:
		if inventory.slots.size() <= inventory_size:
			for x in inventory.slots.size():
				var slot : Slot_Data = inventory.slots[x]
				if slot.item_data != null and slot.quantity > 0 :
					inventory_grid[x].item_count.text = str(slot.quantity)
					inventory_grid[x].item_texture.texture_normal = slot.item_data.item_texture
		else:
			print("your inventory resource is too big")
	pass
