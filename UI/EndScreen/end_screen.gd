extends CanvasLayer

const MAIN_MENU_PATH = "res://UI/MainMenu/MainMenu.tscn"

@onready var win_status_label = $ColorRect/CenterContainer/VBoxContainer/StageClear
@onready var score_label = $ColorRect/CenterContainer/VBoxContainer/ScoreLabel

var did_player_win: bool = true


func _ready() -> void:
	if not did_player_win:
		win_status_label.text = "Time's Up!"
	score_label.text = "Score: %s" % format_commas(ScoreTracker.score)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart_stage"):
		Global.restart_stage.emit()
		queue_free()
	elif Input.is_action_just_pressed("ui_cancel"):
		ScoreTracker.reset_scores()
		get_tree().change_scene_to_file(MAIN_MENU_PATH)


func format_commas(value: int) -> String:
	var string_val = str(value)
	var regex = RegEx.create_from_string(r"(\d)(?=(\d{3})+(?!\d))")
	return regex.sub(string_val, "$1,", true)
