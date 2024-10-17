class_name Player extends CharacterBody2D

@onready var state_machine : PlayerStateMachine = $StateMachine
@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal direction_changed( new_direction : Vector2 )

@export var hp : int = 100
@export var max_hp : int = 100

const DIR_4 = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO


func _ready() -> void:
	PlayerManager.player = self
	state_machine.initialize(self)

func _process( _delta: float ) -> void:
	direction = Vector2( Input.get_axis ( "Input_Left" , "Input_Right" ) , ( Input.get_axis ( "Input_Up", "Input_Down" ) ) ).normalized()

func _physics_process( _delta: float ) -> void:
	print(direction)
	move_and_slide()

func update_animation() -> void:
	animation_player.play( "idle_" + anim_direction() )

func anim_direction() -> String:
	match cardinal_direction:
		Vector2.DOWN:
			return "down"
		Vector2.UP:
			return "up"
		_:
			return "side"

func set_direction() -> bool:
	if direction == Vector2.ZERO:
		return false
	var new_dir : Vector2 = cardinal_direction
	
	if abs(direction.y) < 0.1:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif abs(direction.x) < 0.1:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	direction_changed.emit( new_dir )
	sprite.scale.x = 1 if cardinal_direction == Vector2.LEFT else -1
	return true
	
