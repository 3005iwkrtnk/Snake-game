extends Node2D

@onready var Head: Head = %Head
@onready var HeadSprite = $Head/Sprite2D
@onready var spawner: Spawner = $Spawner as Spawner
@onready var bounds: Bounds = $Bounds




var move_time = 1000
var last_move = 0
var move_dir:Vector2 = Vector2.LEFT
var speed = 5000
var snake_parts:Array[Snake_part] = []


func _ready() -> void:
	Head.food_eaten.connect(_on_food_eaten)
	spawner.tail_added.connect(_on_tail_added)
	spawner.spawn_food()
	snake_parts.push_back(Head)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ui_up'):
		move_dir = Vector2.UP
	if Input.is_action_just_pressed('ui_down'):
		move_dir = Vector2.DOWN
	if Input.is_action_just_pressed('ui_right'):
		move_dir = Vector2.RIGHT
		HeadSprite.flip_h = true 
	if Input.is_action_just_pressed('ui_left'):
		move_dir = Vector2.LEFT
		HeadSprite.flip_h = false

func _physics_process(delta: float) -> void:
	last_move += delta * speed
	if last_move >= move_time:
		update_snake()
		last_move = 0
func update_snake():
	var new_pos:Vector2 = Head.position + move_dir * Global.Grid_size
	new_pos = bounds.wrap_vector(new_pos)
	Head.move_to(new_pos)
	
	for i in range(1,snake_parts.size(),1):
		snake_parts[i].move_to(snake_parts[i-1].last_position)

func _on_food_eaten():
	# Spawn more food
	spawner.call_deferred('spawn_food')
	print('food eaten')
	# add tail
	spawner.call_deferred('spawn_tail' ,snake_parts[snake_parts.size()-1].last_position)
	
	
func _on_tail_added(tail:Tail):
	snake_parts.push_back(tail)
	
	
	
	
