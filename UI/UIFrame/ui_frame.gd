extends MarginContainer

@onready var score_label: Label = $PanelContainer/ScoreMarginContainer/ScoreLabel
@onready var chests_label: Label = $PanelContainer/ChestsMarginContainer/ChestsLabel
@onready var timer_label: Label = $PanelContainer/TimerMarginContainer/TimerLabel
@onready var enemy_label: Label = $PanelContainer/EnemyMarginContainer/EnemyLabel


func _process(_delta: float) -> void:
	score_label.text  = "%07d" % ScoreTracker.score
	chests_label.text  = "%02d" % Global.chests_left
	timer_label.text = "%03d" % $StageTimer.time_left
	enemy_label.text = "%02d" % $EnemyTimer.time_left
