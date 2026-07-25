extends CanvasLayer

const MAIN_MENU_PATH = "res://UI/MainMenu/MainMenu.tscn"

@onready var win_status_label = $ColorRect/CenterContainer/VBoxContainer/StageClear
@onready var score_label = $ColorRect/CenterContainer/VBoxContainer/ScoreLabel

var did_player_win: bool = true


func _ready() -> void:
	if not did_player_win:
		win_status_label.text = "Time's Up!"
	score_label.text = "Score: %d" % ScoreTracker.score


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart_stage"):
		Global.restart_stage.emit()
		queue_free()
	elif Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file(MAIN_MENU_PATH)
