extends Control

enum Input_Type { PRIMARY_CLICK, PRIMARY_UNCLICK } 
const DRAG_TIME_MIN : float = 0.15

signal ui_item_input ( input : Input_Type, slot : Item_Slot )

@onready var item_texture: TextureRect = $ClickDragGroup/ItemTexture
@onready var item_count: Label = $ClickDragGroup/ItemCount
@onready var click_drag_group: PanelContainer = $ClickDragGroup

var dragging : bool = false : set = dragging_toggle

var time_elapsed : float = 0
var primary_pressed : bool = false
var mouse_pos : Vector2 = Vector2.ZERO
var current_slot : Item_Slot
var target_slot : Item_Slot

func _ready() -> void:
	item_texture.texture = null
	item_count.text = ""
	connect( "ui_item_input", _on_ui_item_input )


func _process( delta: float ) -> void:
	mouse_pos = get_global_mouse_position()
	position = mouse_pos
	if primary_pressed == true and dragging == false:
		time_elapsed += delta
		print(time_elapsed)
		if time_elapsed > DRAG_TIME_MIN and dragging == false:
			dragging = true


func _on_ui_item_input( _input : Input_Type, _slot : Item_Slot ) -> void:
	match _input:
		Input_Type.PRIMARY_CLICK:

			if _slot.slot_data.item_data == null:
				return
			time_elapsed = 0
			primary_pressed = true
			item_texture.texture = _slot.slot_data.item_data.item_texture
			item_count.text = str( _slot.slot_data.quantity )
			current_slot = _slot

		Input_Type.PRIMARY_UNCLICK:

			dragging = false
			primary_pressed = false
			item_texture.texture = null
			item_count.text = ""
			time_elapsed = 0


	pass


func dragging_toggle( value ) -> void:
	dragging = value
	if dragging:
		print("dragging")
		visible = true
		if current_slot:
			current_slot.click_drag_group.visible = false

	else:
		print("no longer dragging")
		visible = false
		if current_slot:
			current_slot.click_drag_group.visible = true
			current_slot = null
		pass

	pass
