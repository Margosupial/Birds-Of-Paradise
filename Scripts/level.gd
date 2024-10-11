extends Node2D
class_name Level


@export var local_transition_data : LocalTransitionData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerManager.set_as_parent( self )
	LevelManager.level_load_started.connect( _free_level )
	LevelManager.ui_trigger_transition.connect( _on_trigger_level_transition )
	
func _free_level() -> void:
	PlayerManager.unparent_player( self )
	queue_free()

func _on_trigger_level_transition() -> void:
	local_transition_data.trigger_transition( PlayerManager.player )
	pass
