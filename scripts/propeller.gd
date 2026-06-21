extends Node2D

@export var raycast: RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_class("RigidBody2D"):
			var distance = Vector2(position.x - collider.position.x, position.y - collider.position.y)
			var force = Vector2(-distance.x, 32 * (raycast.target_position.y + distance.y))
			collider.apply_force(force)
