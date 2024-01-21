extends StaticBody2D

const positionOne: Vector2 = Vector2(0, -30)
const positionTwo: Vector2 = Vector2(0, 30)

@export var boringProducts: Array[PackedScene] = []
@export var yumProducts: Array[PackedScene] = []

func _ready():
	var products: Array[PackedScene] = []
	if (is_in_group("boring")):
		products = boringProducts
	else:
		products = yumProducts
	
	var product1Scene: PackedScene = products.pick_random()
	var product2Scene: PackedScene = products.pick_random()
	var product1: Product = product1Scene.instantiate()
	var product2: Product = product2Scene.instantiate()
	
	product1.rotation_degrees = -90
	product2.rotation_degrees = -90
	
	product1.set_global_position(positionOne)
	product2.set_global_position(positionTwo)
	
	add_child(product1)
	add_child(product2)
