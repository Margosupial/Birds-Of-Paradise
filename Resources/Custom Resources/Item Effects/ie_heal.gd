extends Item_Effect
class_name IE_Heal

@export var heal_value : int = 1
 


func use_1() -> void:
	PlayerManager.player.
