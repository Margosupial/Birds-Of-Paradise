extends EnemyState
class_name EnemyStateWander

@export var wander_speed : float = 10.0

@export_category("AI")
@export var state_duration_min : float = 3
@export var state_duration_max : float = 12
@export var next_state : EnemyState

var _timer : float = 0.0
var _direction : Vector2

func init() -> void:
	pass

func enter() -> void:
	_timer = randf_range( state_duration_min, state_duration_max )
	var rand = randi_range( 0, 3 )
	_direction = enemy.DIR_4[ rand ]
	enemy.velocity = _direction * wander_speed
	enemy.set_direction( _direction )
	pass

func exit() -> void:
	pass

func process( _delta: float ) -> EnemyState:
	_timer -= _delta
	if _timer <= 0:
		return next_state
	return null

func physics( _delta: float) -> EnemyState:
	return null
