extends Node2D

var speed: float = TAU
var min_alpha: float = 0.2
var max_alpha: float = 1.0

var time: float = 0.0


func tick_up_color() -> void:
	for child in get_children():
		child.frame += 1


func _process(delta: float) -> void:
	time = fmod(time + delta * speed, TAU)	
	var sine_val: float = (sin(time) + 1.0) / 2.0
	var new_a = lerp(min_alpha, max_alpha, sine_val)
	for child in get_children():
		child.modulate.a = new_a


func explode() -> void:
	for child in get_children():
		child.explode()
