extends Node2D

@export var raycast: RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_class("RigidBody2D"):
			var distance = position.distance_to(collider.position)
			var force = 5 * (raycast.target_position.y + distance)
			collider.apply_force(Vector2(0, force))
