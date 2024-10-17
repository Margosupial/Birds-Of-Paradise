extends Node2D
class_name PlayerInteractionsHost

@onready var player : Player = $".."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.direction_changed.connect( update_direction ) 

func update_direction( new_dir : Vector2 ) -> void:
	match new_dir:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = -90
		_:
			rotation_degrees = 0
