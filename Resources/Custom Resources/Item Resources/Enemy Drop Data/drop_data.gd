extends Resource
class_name DropData


@export var item : Item
@export_range( 0, 100, 1, "suffix:%" ) var probability : float = 100
@export_range( 0, 10, 1, "suffix:items" ) var min_amount : float = 100
@export_range( 0, 10, 1, "suffix:items" ) var max_amount : float = 100

func get_drop_count() -> int:
	if randf_range( 0, 100 ) >= probability:
		return 0
	return randi_range( min_amount, max_amount)
