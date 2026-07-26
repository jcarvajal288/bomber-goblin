extends Node2D

const SCORE_TOAST_SCENE = preload("res://UI/ScoreToast/ScoreToast.tscn")

@onready var score: int = 0
@onready var mult: int = 0
@onready var mult_color: Color = Color.WHITE

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
	toast.modulate = get_color_for_multiplier(multiplier)
	add_child(toast)
	toast.reset_size()
	var half_size_offset = toast.size / 2
	toast.global_position = score_position - half_size_offset
	toast.start()


func get_color_for_multiplier(multiplier: int) -> Color:
	if multiplier <= -1:
		return Color.MAGENTA
	elif multiplier >= 8:
		return Color.DEEP_PINK
	elif multiplier >= 6:
		return Color.RED
	elif multiplier >= 4:
		return Color.ORANGE
	elif multiplier >= 2:
		return Color.YELLOW
	else:
		return Color.GREEN


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
		mult_color = get_color_for_multiplier(mult)
	$MultTimer.start(3.0)
