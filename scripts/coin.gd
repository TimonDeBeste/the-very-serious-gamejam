extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(randi_range(64, 1010), randi_range(64, 610))

func _process(_delta: float) -> void:
	match Global.game_state:
		"running":
			visible = true
		_:
			visible = false
