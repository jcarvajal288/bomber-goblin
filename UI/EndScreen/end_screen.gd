extends CanvasLayer

@onready var win_status_label = $ColorRect/CenterContainer/VBoxContainer/StageClear
@onready var score_label = $ColorRect/CenterContainer/VBoxContainer/ScoreLabel

var did_player_win: bool = true


func _ready() -> void:
	if not did_player_win:
		win_status_label.text = "Game Over!"
	score_label.text = "Score: %d" % ScoreTracker.score


func _process(_delta: float) -> void:
	if Input.is_action_pressed("restart_stage"):
		Global.restart_stage.emit()
		queue_free()
