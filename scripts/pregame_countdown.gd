extends Control
	
func activate():
	for i in range(3):
		$Label.text = str(3 - i)
		await get_tree().create_timer(1.0).timeout
	Global.game_state = "running"
		
