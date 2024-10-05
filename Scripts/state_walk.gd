class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State = $"../Idle"

func Enter() -> void:
	#this is where i will update player animation
	pass

func Exit() -> void:
	pass

func Process( _delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		#Here is where I will update the player walk animation
		pass
	
	return null

func Physics( _delta : float) -> State:
	return null

func HandleInput( _event : InputEvent ) -> State:
	return null
