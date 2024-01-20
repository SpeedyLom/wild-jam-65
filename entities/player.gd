class_name Player
extends CharacterBody2D

@onready var animationPlayer := $AnimationPlayer

@export var speed: int = 200

var heldProduct: Product = null

func get_input() -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	match input_direction:
		Vector2.LEFT:
			animationPlayer.play("left")
		Vector2.RIGHT:
			animationPlayer.play("right")
		Vector2.DOWN:
			animationPlayer.play("down")
		Vector2.UP:
			animationPlayer.play("up")
	
	velocity = input_direction * speed

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
	
	if (hasItem()):
		heldProduct.global_position = global_position + Vector2(0, -20)

func hasItem() -> bool:
	return heldProduct != null
	
func holdItem(product: Product) -> void:
	call_deferred("add_child", product)
	heldProduct = product
	
func takeItem() -> void:
	heldProduct.queue_free()
