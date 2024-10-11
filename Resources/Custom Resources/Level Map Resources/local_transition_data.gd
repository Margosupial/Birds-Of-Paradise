extends Resource
class_name LocalTransitionData

@export_file( "*tscn") var level

@export var target_transition_area : String = "LevelTransition"


func trigger_transition( _player :Node2D ) -> void:
	LevelManager.load_new_level( level, target_transition_area, Vector2.ZERO)
	pass

func _place_player() -> void:
	if self.name != LevelManager.target_transition:
		return
	PlayerManager.set_player_position( self.global_position + LevelManager.position_offset)
