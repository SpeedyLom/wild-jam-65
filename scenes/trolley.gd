class_name Trolley
extends AnimatableBody2D

@export var speed: int = 100
@export var follow_speed: int = 5

@onready var camera := $Camera2D

func _ready() -> void:
	camera.enabled = true
	camera.make_current()

func _process(delta):
	var direction := Vector2.UP
	var velocity = direction * speed
	translate(velocity * delta)
