extends CharacterBody2D
class_name Enemy

signal direction_changed( new_direction : Vector2)
signal enemy_damaged

const DIR_4 = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@onready var enemy_state_machine: EnemyStateMachine = $EnemyStateMachine
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var hp : int = 1

var cardinal_direction : Vector2 = Vector2.DOWN 
var direction : Vector2 = Vector2.ZERO
var player : Player
var invulnerable : bool = false


func _ready() -> void:
	enemy_state_machine.initialize( self )
	player = PlayerManager.player
	pass

func _physics_process( _delta: float) -> void:
	move_and_slide()

func set_direction( _new_direction ) -> bool:
	direction = _new_direction
	if direction == Vector2.ZERO:
		return false
	
	var direction_id : int = ( int( round( 
			( direction + cardinal_direction * 0.1 ).angle()
			/ TAU + DIR_4.size() ) - 1
	) )
	#This part is fucked, the "-1"   ^   seemingly fixes it but i dont know why
	var new_dir = DIR_4[ direction_id ]
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	direction_changed.emit( new_dir )
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true
