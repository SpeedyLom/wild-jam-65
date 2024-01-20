class_name Product
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body: Player):
	if (body.hasItem() == false):
		body.holdItem(self.duplicate())
		set_deferred("monitoring", false)
		call_deferred("queue_free")
