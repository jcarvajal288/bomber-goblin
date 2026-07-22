extends Node2D


func tick_up_color() -> void:
	for sprite in get_children():
		sprite.frame += 1
