extends UI_Window
class_name Inventory_UI

const INVENTORY_SLOT = preload("res://UI Elements/UI Subelements/item_slot.tscn")

@onready var item_slot_grid: GridContainer = $Control/PanelContainer/PanelContainer/HBoxContainer/VBoxContainer/ItemSlotGrid

@export var inventory_size : int
@export var inv_resource : Inventory_Data 
@export var wood_button_test_inv_data : Inventory_Data


func _ready() -> void:
	pass

func clear_inventory():
	for child in get_children():
		child.queue_free()


func update_inventory() -> void:
	for slot in inv_resource.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child( new_slot )
		new_slot.slot_data = slot



func _on_add_wood_test_button_pressed() -> void:
	pass
