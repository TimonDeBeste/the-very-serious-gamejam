extends Node2D


@export var raycast: RayCast2D


func _process(_delta: float) -> void:
	
	if raycast.is_colliding(): # Propeller system
		var collider = raycast.get_collider()
		if collider.is_class("RigidBody2D"):
			var distance = Vector2(position.x - collider.position.x, position.y - collider.position.y)
			var force = Vector2(-distance.x * 16, 8 * (raycast.target_position.y + distance.y))
			collider.apply_force(force)
			
	position.x = get_global_mouse_position().x
