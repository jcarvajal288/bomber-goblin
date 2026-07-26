extends Node2D

const SCORE_TOAST_SCENE = preload("res://UI/ScoreToast/ScoreToast.tscn")

@onready var score: = 0
@onready var mult: = 0

signal add_score(amount: int, score_position: Vector2, multiplier: int)
signal add_mult(amount)


func _ready() -> void:
	Global.show_toast.connect(_show_toast)
	Global.restart_stage.connect(_restart_stage)
	add_score.connect(_add_score)
	add_mult.connect(_add_mult)
	$MultTimer.timeout.connect(func (): mult = 0)


func _add_score(amount: int, score_position: Vector2, multiplier: int) -> void:
	var adjusted_amount = 1
	if (multiplier < 0):
		adjusted_amount = multiplier * amount
	else:
		adjusted_amount = amount * (2 ** multiplier)
	score += adjusted_amount
	var toast = SCORE_TOAST_SCENE.instantiate()
	toast.text = str(adjusted_amount)
	if multiplier <= -1:
		toast.modulate = Color.MAGENTA
	elif multiplier >= 8:
		toast.modulate = Color.DEEP_PINK
	elif multiplier >= 6:
		toast.modulate = Color.RED
	elif multiplier >= 4:
		toast.modulate = Color.ORANGE
	elif multiplier >= 2:
		toast.modulate = Color.YELLOW
	else:
		toast.modulate = Color.GREEN
	add_child(toast)
	toast.reset_size()
	var half_size_offset = toast.size / 2
	toast.global_position = score_position - half_size_offset
	toast.start()


func _show_toast(text: String, toast_position, color: Color) -> void:
	var toast = SCORE_TOAST_SCENE.instantiate()
	toast.text = text
	toast.modulate = color
	add_child(toast)
	toast.reset_size()
	var half_size_offset = toast.size / 2
	toast.global_position = toast_position - half_size_offset
	toast.start()


func _restart_stage() -> void:
	score = 0
	mult = 0


func _add_mult(amount: int) -> void:
	if amount > mult:
		mult = amount
	$MultTimer.start(3.0)
