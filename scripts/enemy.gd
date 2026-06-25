extends Area2D

@onready var main = get_tree()
var falling = false
var fall_speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randi_range(50, 1000)
	for i in range(10):
		await get_tree().create_timer(0.25).timeout
		visible = not visible
		if Global.game_state != "running":
			visible = false
			i -= 1
	falling = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.game_state:
		"running":
			
			if falling:
				visible = true
				position.y += fall_speed * delta
			
			if position.y > 1200:
				queue_free()
		_:
			visible = false
