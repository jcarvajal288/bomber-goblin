extends Node2D

const BLACK_BOMB_SCENE = preload("res://Bombs/BlackBomb/BlackBomb.tscn")


func _ready() -> void:
	Global.spawn_bomb.connect(_spawn_bomb)


func _spawn_bomb(bomb_position: Vector2) -> void:
	var bomb = BLACK_BOMB_SCENE.instantiate()
	bomb.global_position = bomb_position
	add_child(bomb)