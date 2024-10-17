extends Node

const GREG = preload("res://Scenes/Entities/greg.tscn")
const INVENTORY_DATA : Inventory_Data = preload("res://Resources/Custom Resources/Inventory Data/player_inventory.tres")


var player : Player
var player_spawned : bool = false

func _ready() -> void:
	add_player_instance()
	await get_tree().create_timer(0.05).timeout
	player_spawned = true

func add_player_instance() -> void:
	player = GREG.instantiate()
	add_child( player )
	pass

func set_player_position( _new_pos : Vector2 ) -> void:
	player.global_position = _new_pos
	pass

func set_as_parent( parent : Node2D ) -> void:
	if player.get_parent():
		player.get_parent().remove_child( player )
	parent.add_child( player )

func unparent_player( parent : Node2D ) -> void:
	parent.remove_child( player )
