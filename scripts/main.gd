extends Node2D

var score: int = 0

@export var enemy_chance: int
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match Global.game_state:
		"running":
			var enemycount: int = 0
			for child in get_children():
				if "enemy" in child.name:
					enemycount += 1
			if enemycount < 4 and randi_range(1, 10) == 10:
				var enemy = preload("res://scenes/enemy.tscn").instantiate()
				add_child(enemy)
				enemy.name = "enemy"
			
			label.text = str("Score: ", score)
