extends Node2D

var score: int = 0

@export var enemy_chance: int
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game_state = "pre_game"
	$pregame_countdown.activate()

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
			if Input.is_action_just_pressed("pause"):
				Global.game_state = "paused"
		
			$game_over.hide()
			$pause.hide()
			$pregame_countdown.hide()
		"game_over":
			$game_over/CenterContainer/Control/score_label.text = str("Score: ", score)
			var restart_btn: Button = $game_over/CenterContainer/Control/restart
			
			if restart_btn.button_pressed:
				get_tree().reload_current_scene()
				
			
			$game_over.show()
			$pause.hide()
			$pregame_countdown.hide()
		"paused":
			
			var continue_button: Button = $"pause/CenterContainer/Control/continue_button"
			var quit_button: Button = $"pause/CenterContainer/Control/quit_button"
			
			if continue_button.button_pressed or Input.is_action_just_pressed("pause"):
				Global.game_state = "running"
			if quit_button.button_pressed:
				get_tree().quit()
			
			$pause.show()
			$pregame_countdown.hide()
			$game_over.hide()
		"pre_game":
			$pregame_countdown.show()
			
			$pause.hide()
			$game_over.hide()
	
