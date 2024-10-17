extends Inventory_UI
class_name Player_Inventory



func _ready() -> void:
	inv_resource = PlayerManager.INVENTORY_DATA
	initialize_window()
	clear_inventory()
