extends UI_Window
class_name Inventory_UI

const INVENTORY_SLOT = preload("res://UI Elements/UI Subelements/item_slot.tscn")

@onready var item_slot_grid: GridContainer = $Control/PanelContainer/PanelContainer/HBoxContainer/VBoxContainer/ItemSlotGrid

@export var inv_size : int = 15
@export var inv_resource : Inventory_Data


func _ready() -> void:
	_assign_exit_button()
	clear_inventory()
	inv_resource.changed.connect( _on_inventory_changed )


func _toggle_visible():
	if self.visible == false:
		update_inventory()
	else:
		clear_inventory()
	self.visible = not self.visible


func clear_inventory():
	for child in item_slot_grid.get_children():
		child.queue_free()


func update_inventory() -> void:
	for slot in inv_resource.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		item_slot_grid.add_child( new_slot )
		new_slot.slot_data = slot



func _on_inventory_changed() -> void:
	clear_inventory()
	update_inventory()
	
	
	
	
	
	
	
