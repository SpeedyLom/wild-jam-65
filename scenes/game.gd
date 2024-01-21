extends Node

@onready var countdownTimer: Timer = $Timer
@onready var countdownLabel: Label = $CanvasLayer/MarginContainer/Countdown
@onready var scoreLabel: ProgressBar = $CanvasLayer/NinePatchRect/Score
@onready var spendLabel: Label = $CanvasLayer/NinePatchRect3/HBoxContainer/Spend
@onready var groceriesLabel: Label = $CanvasLayer/MarginContainer2/HBoxContainer/Groceries
@onready var treatsLabel: Label = $CanvasLayer/MarginContainer2/HBoxContainer/Treats

var score: int = 0
var spend: int = 0
var groceries: int = 0
var treats: int = 0
var ratio: int = 0
@export var creditLimit: int = 100

func _ready():
	$CanvasLayer/NinePatchRect3/HBoxContainer/CreditLimit.set_text(str(creditLimit))
	pass

func _process(delta):
	countdownLabel.set_text(str(int(countdownTimer.time_left)))
	spendLabel.set_text(str(spend))

func _on_timer_timeout():
	var endScreen = load("res://scenes/game_over.tscn")
	Global.lost = true
	
	if (spend > creditLimit):
		Global.maxedCard = true
		Global.lost = false
	elif (score >= 100):
		Global.maxedCart = true
		Global.lost = false
	elif (treats > groceries):
		Global.excessTreats = true
		Global.lost = false
	
	get_tree().change_scene_to_packed(endScreen)
	
func updateScore(product: Product) -> void:
	if (product.is_in_group("treat")):
		treats += 1
	else:
		groceries += 1
	
	score += product.weight
	scoreLabel.value = score
	
	spend += product.price
	
	groceriesLabel.set_text(str(groceries))
	treatsLabel.set_text(str(treats))
