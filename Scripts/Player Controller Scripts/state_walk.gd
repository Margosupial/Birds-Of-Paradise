class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle : State = $"../Idle"

func enter() -> void:
	#this is where i will update player animation
	pass

func exit() -> void:
	pass

func process( _delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		#Here is where I will update the player walk animation
		pass
	
	return null

func physics( _delta : float) -> State:
	return null

func handle_input( _event : InputEvent ) -> State:
	return null
