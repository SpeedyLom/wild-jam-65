extends Node2D

func _on_visible_on_screen_notifier_2d_screen_exited():
	var Aisle := load("res://scenes/aisle.tscn")
	var aisle = Aisle.instantiate()
	
	aisle.global_position = global_position + Vector2(0, -732)
	
	add_sibling(aisle)
	queue_free()
