class_name GameOver extends CanvasLayer

const START_SCREEN = preload("res://Scenes/Menus/start_screen.tscn")

@onready var score: Label = %ScoreLabel
@onready var high_score: Label = %HighScoreLabel
@onready var restart: Button = %Restart
@onready var quit: Button = %Quit


func set_score(n:int):
	score.text = 'Final score: ' + str(n)
	# todo - high score logic and saving

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/start_screen.tscn")
