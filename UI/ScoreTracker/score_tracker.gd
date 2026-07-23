extends Node2D

const SCORE_TOAST_SCENE = preload("res://UI/ScoreToast/ScoreToast.tscn")

@onready var score: = 0

signal add_score(amount: int, score_position: Vector2)


func _ready() -> void:
	add_score.connect(_add_score)


func _add_score(amount: int, score_position: Vector2) -> void:
	score += amount
	var toast = SCORE_TOAST_SCENE.instantiate()
	toast.text = str(amount)
	toast.modulate = Color.GREEN
	add_child(toast)
	toast.reset_size()
	var half_size_offset = toast.size / 2
	toast.global_position = score_position - half_size_offset
	toast.start()