extends Node2D

const BLACK_BOMB_SCENE = preload("res://Bombs/BlackBomb/BlackBomb.tscn")
const BIG_EXPLOSION_SCENE = preload("res://Bombs/Effects/BigExplosion/BigExplosion.tscn")


func _ready() -> void:
	Global.spawn_bomb.connect(_spawn_bomb)
	Global.spawn_big_explosion.connect(_spawn_big_explosion)


func _spawn_bomb(bomb_position: Vector2) -> void:
	var player_position = Global.player.global_position
	var bomb = BLACK_BOMB_SCENE.instantiate()
	var grid_x = snapped(bomb_position.x, 8)
	var grid_y = snapped(bomb_position.y, 8)
	if (grid_x <= player_position.x):
		grid_x += 4
	else:
		grid_x -= 4
	if (grid_y <= player_position.y):
		grid_y += 4
	else:
		grid_y -= 4
	var grid_snapped = Vector2(grid_x, grid_y)
	bomb.global_position = grid_snapped
	add_child(bomb)


func _spawn_big_explosion(bomb_position: Vector2) -> void:
	var explosion = BIG_EXPLOSION_SCENE.instantiate()
	explosion.global_position = bomb_position
	add_child(explosion)