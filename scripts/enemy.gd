extends Area2D

@onready var main = get_tree()
var falling = false
var fall_speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randi_range(1, 1000)
	
	for i in range(12):
		await get_tree().create_timer(0.25).timeout
		visible = not visible
		
	falling = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if falling:
		position.y += fall_speed * delta
