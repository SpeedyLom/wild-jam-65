extends Node2D

@onready var Aisle := preload("res://scenes/aisle.tscn")
@onready var Aisles := $Aisles

var aislePosition := -0
const aisleHeight := -340

func _ready():
	var aisle = Aisle.instantiate()
	
	aislePosition += aisleHeight
	aisle.set_global_position(Vector2(0, aislePosition))
	
	Aisles.add_child(aisle)
