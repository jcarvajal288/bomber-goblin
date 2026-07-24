extends CanvasLayer

@onready var score_label = $ColorRect/CenterContainer/VBoxContainer/ScoreLabel


func _ready() -> void:
	score_label.text = "Score: %d" % ScoreTracker.score


func _process(_delta: float) -> void:
	if Input.is_action_pressed("restart_stage"):
		Global.restart_stage.emit()
		queue_free()
