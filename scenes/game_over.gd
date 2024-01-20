extends Control

func _on_button_pressed():
	var game = load("res://scenes/game.tscn")

	get_tree().change_scene_to_packed(game)
