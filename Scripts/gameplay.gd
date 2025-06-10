extends Node2D

@onready var Head: Head = %Head
@onready var HeadSprite = $Head/Sprite2D




var move_time = 1000
var last_move = 0
var move_dir:Vector2 = Vector2.RIGHT 
var speed = 1500

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
	print('move the snake')
	Head.position = Head.position + move_dir * 32
	
	
	
