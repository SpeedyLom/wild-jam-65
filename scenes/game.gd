extends Node

@onready var countdownTimer: Timer = $Timer
@onready var countdownLabel: Label = $CanvasLayer/MarginContainer/Countdown
@onready var scoreLabel: ProgressBar = $CanvasLayer/NinePatchRect/Score

var score: int = 0


func _ready():
	pass

func _process(delta):
	countdownLabel.set_text(str(int(countdownTimer.time_left)))
	

func _on_timer_timeout():
	var gameOver = load("res://scenes/game_over.tscn")
	get_tree().change_scene_to_packed(gameOver)
	
func updateScore() -> void:
	score += 1
	scoreLabel.value = score
