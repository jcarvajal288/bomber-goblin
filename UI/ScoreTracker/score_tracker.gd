extends Node2D

const SCORE_TOAST_SCENE = preload("res://UI/ScoreToast/ScoreToast.tscn")

@onready var score: = 0

signal add_score(amount: int, score_position: Vector2, multiplier: int)


func _ready() -> void:
	add_score.connect(_add_score)


func _add_score(amount: int, score_position: Vector2, multiplier: int) -> void:
	var adjusted_amount = 1
	if (multiplier <= 0):
		adjusted_amount = multiplier * amount
	else:
		adjusted_amount = amount * (2 ** multiplier)
	score += adjusted_amount
	var toast = SCORE_TOAST_SCENE.instantiate()
	toast.text = str(adjusted_amount)
	if multiplier <= -1:
		toast.modulate = Color.PURPLE
	elif multiplier == 0:
		toast.modulate = Color.GREEN
	elif multiplier == 1:
		toast.modulate = Color.YELLOW
	elif multiplier == 2:
		toast.modulate = Color.ORANGE
	elif multiplier == 3:
		toast.modulate = Color.RED
	else:
		toast.modulate = Color.CRIMSON
	add_child(toast)
	toast.reset_size()
	var half_size_offset = toast.size / 2
	toast.global_position = score_position - half_size_offset
	toast.start()
