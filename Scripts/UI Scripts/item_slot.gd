extends Button
class_name Item_Slot

const DRAG_TIME_MIN : float = 0.15

@onready var item_texture: TextureRect = $"PanelContainer/ClickDragGroup/ItemTexture"
@onready var item_count: Label = $"PanelContainer/ClickDragGroup/ItemCount"
@onready var click_drag_group: PanelContainer = $PanelContainer/ClickDragGroup

@export var slot_data : Slot_Data : set = _update_slot_data

func _ready() -> void:
	item_texture.texture = null
	item_count.text = ""
	connect( "button_down", _on_button_down )
	connect( "button_up", _on_button_up )

func _update_slot_data( value : Slot_Data ) -> void:
	slot_data = value
	if slot_data == null:
		item_texture.texture = null
		item_count.text = ""
		return
	if slot_data.item_data == null:
		return
	item_texture.texture = slot_data.item_data.item_texture
	item_count.text = str( slot_data.quantity)
 

func _on_button_down() -> void:
	if slot_data:
		MouseFollower.ui_item_input.emit( MouseFollower.Input_Type.PRIMARY_CLICK, self )
func _on_button_up() -> void:
	if slot_data:
		MouseFollower.ui_item_input.emit( MouseFollower.Input_Type.PRIMARY_UNCLICK, self )
