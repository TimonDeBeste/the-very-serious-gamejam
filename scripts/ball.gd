extends RigidBody2D

var max_y = 500
@export var hurtbox: Area2D
@onready var main = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var propeller = get_parent().get_child(1)
	if propeller.has_method("add_raycast_exception"):
		propeller.add_raycast_exception($hurtbox)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#rotation = position.x / 32
	
	for area in hurtbox.get_overlapping_areas():
		if "enemy" in area.name and area.falling:
			queue_free()
		if "coin" in area.name:
			main.score += 1
			area.queue_free()
			var coin = preload("res://scenes/coin.tscn").instantiate()
			add_sibling(coin)
			coin.name = "coin"
			
	linear_velocity
			
	
