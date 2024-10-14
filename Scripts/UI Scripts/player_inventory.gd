extends Inventory_UI
class_name Player_Inventory



func _ready() -> void:
	inv_resource = PlayerManager.INVENTORY_DATA
	_assign_exit_button()
	clear_inventory()
