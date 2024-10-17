extends EnemyState
class_name EnemyStateWander

const PICKUP = preload("res://Scenes/Entities/item_entity.tscn")

@export var wander_speed : float = 10.0

@export_category("AI")
@export var state_duration_min : float = 3
@export var state_duration_max : float = 12
@export var next_state : EnemyState

@export_category("Item Drops")
@export var drops : Array[ DropData ]
@export var drop_speed : int = 5


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

func drop_items() -> void:
	if drops.size() == 0:
		return

	for i in drops.size():
		if drops[ i ] == null or drops[ i ].item == null:
			continue
		var drop_count : int = drops[ i ].get_drop_count()
		for j in drop_count:
			var drop : Item_Entity = PICKUP.instantiate() as Item_Entity
			drop.item_data = drops[ i ].item
			PlayerManager.player.add_sibling( drop )
			drop.global_position = enemy.global_position
			drop.velocity = Vector2(randf(),randf()) * drop_speed
	pass


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Kill_Test"):
		drop_items()
		get_parent().get_parent().queue_free()
