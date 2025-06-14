extends CanvasLayer

const gameplay_scene:PackedScene = preload("res://Scenes/snake_game.tscn")

@onready var score_label: Label = %ScoreLabel
@onready var start_button: Button = %StartButton
@onready var quit_button: Button = %QuitButton


func _ready() -> void:
	var high_score:int = 0
	score_label.text = 'High score: ' + str(high_score)
	

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(gameplay_scene)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
