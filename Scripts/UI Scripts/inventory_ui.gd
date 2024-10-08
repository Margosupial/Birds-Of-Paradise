extends UI_Window
class_name Inventory_UI

@onready var item_slot_grid: GridContainer = $Control/PanelContainer/PanelContainer/HBoxContainer/VBoxContainer/ItemSlotGrid

@export var inventory_size : int = 5

@export var item_slot : PackedScene 

var inventory : Array[ Item_Slot ]

func _ready() -> void:
	generate_inventory_slots()
	pass

func generate_inventory_slots() -> void:
	inventory = []
	for x in inventory_size:
		var new_slot : Item_Slot = item_slot.instantiate()
		inventory.append(new_slot)
		item_slot_grid.add_child(new_slot)
	pass
