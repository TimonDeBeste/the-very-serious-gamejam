extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if randi_range(1, 1000) < 20:
		var enemy = preload("res://scenes/enemy.tscn").instantiate()
		add_child(enemy)
		enemy.name = "enemy"
