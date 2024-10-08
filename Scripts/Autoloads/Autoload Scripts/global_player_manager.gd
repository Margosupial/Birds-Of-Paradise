extends Node

const GREG = preload("res://Scenes/Entities/greg.tscn")

var player : Player

func _ready() -> void:
	add_player_instance()

func add_player_instance() -> void:
	player = GREG.instantiate()
	add_child( player )
	pass


func set_as_parent( parent : Node2D ) -> void:
	if player.get_parent():
		player.get_parent().remove_child( player )
	parent.add_child( player )

func unparent_player( parent : Node2D ) -> void:
	parent.remove_child( player )
