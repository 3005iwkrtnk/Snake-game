class_name Spawner extends Node2D

# Signals
signal tail_added(tail:Tail)
# Export vars
@export var bounds:Bounds
# Instantiating packed scenes
var food_scene:PackedScene = preload("res://Scenes/food.tscn")
var tail_scene:PackedScene = preload("res://Scenes/tail.tscn")



func spawn_food():
	# Spawn position (position)
	var spawn_point:Vector2 = Vector2.ZERO
	spawn_point.x = randf_range(bounds.x_min + Global.Grid_size, bounds.x_max - Global.Grid_size)
	spawn_point.y = randf_range(bounds.y_min + Global.Grid_size, bounds.y_max - Global.Grid_size)
	
	spawn_point.x = floorf(spawn_point.x / Global.Grid_size) * Global.Grid_size
	spawn_point.y = floorf(spawn_point.y / Global.Grid_size) * Global.Grid_size
	
	
	# Spawned object (instantiating)
	var food =  food_scene.instantiate()
	food.position = spawn_point
	# Spawn parent (parenting)
	get_parent().add_child(food)
	
	
func spawn_tail(pos: Vector2):
	var tail:Tail = tail_scene.instantiate() as Tail
	tail.position = pos 
	get_parent().add_child(tail)
	tail_added.emit(tail)
	
	
	
	
	
	
	
	
