extends CanvasLayer

const MAIN_MENU_PATH = "res://UI/MainMenu/MainMenu.tscn"

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Global.pause_game.emit(false)
		queue_free()
	elif Input.is_action_just_pressed("quit_to_menu"):
		ScoreTracker.reset_scores()
		get_tree().change_scene_to_file(MAIN_MENU_PATH)
