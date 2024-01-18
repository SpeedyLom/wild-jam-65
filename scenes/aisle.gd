extends Node2D

@onready var Aisle := preload("res://scenes/aisle.tscn")

func _on_visible_on_screen_notifier_2d_screen_exited():
	var aisle = Aisle.instantiate()
	
	aisle.global_position = global_position + Vector2(0, -732)
	
	add_sibling(aisle)
	queue_free()
