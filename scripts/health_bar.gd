extends HBoxContainer

@export var empty_texture: CompressedTexture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match Global.health:
		2:
			$health3.texture = empty_texture
		1:
			$health2.texture = empty_texture
		0:
			$health.texture = empty_texture
			Global.game_state = "game_over"
