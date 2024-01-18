class_name Trolley
extends AnimatableBody2D

@export var speed: int = 100
@export var follow_speed: int = 5

@onready var camera := $Camera2D
@onready var timer := $Timer

var waiting := false;

func _ready() -> void:
	camera.enabled = true
	camera.make_current()
	
	timer.wait_time = randi_range(15, 25)
	timer.start()

func _process(delta):
	if waiting == false:
		var direction := Vector2.UP
		var velocity = direction * speed
		translate(velocity * delta)

func _on_timer_timeout():
	waiting = not waiting
	
	if waiting:
		timer.wait_time = randi_range(2, 6)
	else:
		timer.wait_time = randi_range(10, 25)
		
	timer.start()
