extends RigidBody2D

var max_y = 500
@export var hurtbox: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#rotation = position.x / 32
	
	for area in hurtbox.get_overlapping_areas():
		print(area.name)
		if "enemy" in area.name:
			if area.falling:
				queue_free()
