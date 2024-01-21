extends Control

func _ready():
	if (Global.maxedCard):
		showMaxedCard()
		
	if (Global.maxedCart):
		showMaxedCart()
		
	if (Global.excessTreats):
		showExcessTreats()
		
	if (Global.lost):
		$Lost.visible = true

func hideLost() -> void:
	$Lost.visible = false

func showMaxedCart() -> void:
	$OverloadedCart.visible = true
	hideLost()

func showMaxedCard() -> void:
	$MaxedCard2.visible = true
	hideLost()
	
func showExcessTreats() -> void:
	$ExcessTreats.visible = true
	hideLost()

func _on_button_pressed():
	var game = load("res://scenes/game.tscn")

	get_tree().change_scene_to_packed(game)
