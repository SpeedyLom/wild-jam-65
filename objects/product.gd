class_name Product
extends Area2D

@export var price: int = 2
@export var weight: int = 3

func _on_body_entered(body: Player):
	if (body.hasItem() == false):
		body.holdItem(self.duplicate())
		set_deferred("monitoring", false)
		call_deferred("queue_free")
