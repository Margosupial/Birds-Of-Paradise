class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

@onready var state_machine : PlayerStateMachine = $StateMachine
@onready var sprite : Sprite2D = $Sprite2D

func _ready() -> void:
	state_machine.Intitialize(self)

func _process( delta: float ) -> void:
	direction = Vector2( Input.get_axis ( "Input_Left" , "Input_Right" ) , ( Input.get_axis ( "Input_Up", "Input_Down" ) ) )
	direction = direction.normalized()
	pass


func _physics_process( delta: float ) -> void:
	move_and_slide()

func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif  direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true
	
