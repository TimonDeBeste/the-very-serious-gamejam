extends Control

@onready var start_btn: = $buttons/start
@onready var settings_btn: = $buttons/settings
@onready var settings: = $settings
@onready var quit_btn: = $buttons/quit
@onready var back_btn: = $settings/back
@onready var buttons: = $buttons

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if start_btn.button_pressed:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	if settings_btn.button_pressed:
		settings.show()
		buttons.hide()
	if back_btn.button_pressed:
		settings.hide()
		buttons.show()
	if quit_btn.button_pressed:
		get_tree().quit()
