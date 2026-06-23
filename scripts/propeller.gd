extends Node2D


@export var raycasts: Array[RayCast2D]
@export var exceptions: Array[CollisionObject2D]

var min_x = 49
var max_x = 1103

func _ready() -> void:
	for exception in exceptions:
		add_raycast_exception(exception)
		
	$AnimatedSprite2D.play("default")

func _process(_delta: float) -> void:
	for raycast in raycasts:# Propeller system
		if raycast.is_colliding(): 
			var collider = raycast.get_collider()
			print(collider)
			if collider.is_class("RigidBody2D"):
				var distance = Vector2(position.x - collider.position.x, position.y - collider.position.y)
				var force = Vector2(-distance.x, (raycast.target_position.y + distance.y))
				collider.apply_force(force)
				
	position.x = get_global_mouse_position().x
	
	if position.x < min_x:
		position.x = min_x
	if position.x > max_x:
		position.x = max_x

func add_raycast_exception(exception: CollisionObject2D):
	for raycast in raycasts:
		raycast.add_exception(exception)
