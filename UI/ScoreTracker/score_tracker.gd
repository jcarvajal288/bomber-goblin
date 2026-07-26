extends Node2D

const SCORE_TOAST_SCENE = preload("res://UI/ScoreToast/ScoreToast.tscn")

@onready var score: int = 0
@onready var mult: int = 0
@onready var max_mult: int = 0
@onready var mult_color: Color = Color.WHITE
@onready var deaths: int = 0
@onready var chests_left: int = 0
@onready var enemies_left: int = 0

signal add_score(amount: int, score_position: Vector2, multiplier: int)
signal add_mult(amount)


func _ready() -> void:
	Global.show_toast.connect(_show_toast)
	Global.restart_stage.connect(reset_scores)
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
		return Color.BLUE_VIOLET
	elif multiplier >= 64:
		return Color.PURPLE
	elif multiplier >= 32:
		return Color.MAGENTA
	elif multiplier >= 24:
		return Color.RED
	elif multiplier >= 16:
		return Color.ORANGE_RED
	elif multiplier >= 12:
		return Color.ORANGE
	elif multiplier >= 10:
		return Color.TOMATO
	elif multiplier >= 8:
		return Color.YELLOW
	elif multiplier >= 6:
		return Color.GREEN_YELLOW
	elif multiplier >= 4:
		return Color.GREEN
	else:
		return Color.WHITE


func _show_toast(text: String, toast_position, color: Color) -> void:
	var toast = SCORE_TOAST_SCENE.instantiate()
	toast.text = text
	toast.modulate = color
	add_child(toast)
	toast.reset_size()
	var half_size_offset = toast.size / 2
	toast.global_position = toast_position - half_size_offset
	toast.start()


func reset_scores() -> void:
	score = 0
	mult = 0
	chests_left = 0
	enemies_left = 0
	max_mult = 0
	deaths = 0


func _add_mult(amount: int) -> void:
	if amount > mult:
		mult = amount
		mult_color = get_color_for_multiplier(mult)
	if amount > max_mult:
		max_mult = amount
	$MultTimer.start(3.0)
