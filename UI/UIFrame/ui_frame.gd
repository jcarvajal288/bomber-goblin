extends MarginContainer

@onready var score_label: Label = $PanelContainer/ScoreMarginContainer/ScoreLabel
@onready var chests_label: Label = $PanelContainer/ChestsMarginContainer/ChestsLabel
@onready var timer_label: Label = $PanelContainer/TimerMarginContainer/TimerLabel
@onready var enemy_label: Label = $PanelContainer/EnemyMarginContainer/EnemyLabel
@onready var mult_label: Label = $PanelContainer/MultCounterMarginCountainer/MultCounter


func _ready() -> void:
	Global.respawn_player.connect(decrease_timer)
	Global.restart_stage.connect(_restart_stage)
	$StageTimer.timeout.connect(time_over)


func _process(_delta: float) -> void:
	score_label.text  = "%012d" % ScoreTracker.score
	chests_label.text  = "%02d" % Global.chests_left
	timer_label.text = "%03d" % $StageTimer.time_left
	enemy_label.text = "%02d" % Global.enemies_left
	if ScoreTracker.mult > 0:
		mult_label.text = "2^%d" % ScoreTracker.mult
	else:
		mult_label.text = ""


func decrease_timer() -> void:
	var new_time = $StageTimer.time_left - 30
	if new_time <= 0:
		$StageTimer.start(0.1)
	else:
		$StageTimer.start(new_time)


func _restart_stage() -> void:
	$StageTimer.start(300)


func time_over() -> void:
	Global.signal_defeat.emit()
