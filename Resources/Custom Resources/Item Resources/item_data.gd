extends Resource
class_name Item


@export var name : String
@export_multiline var description : String

@export var item_texture : Texture2D
@export var entity_texture : Texture2D
@export var entity : PackedScene

@export var stackable : bool
@export var stack_size : int
