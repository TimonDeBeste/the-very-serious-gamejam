extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(randi_range(64, 1010), randi_range(64, 610))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
