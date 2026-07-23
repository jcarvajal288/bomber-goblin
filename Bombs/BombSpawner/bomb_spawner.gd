extends Node2D

const BLACK_BOMB_SCENE = preload("res://Bombs/BlackBomb/BlackBomb.tscn")
const BIG_EXPLOSION_SCENE = preload("res://Bombs/Effects/BigExplosion/BigExplosion.tscn")
const SMALL_EXPLOSION_SCENE = preload("res://Bombs/Effects/SmallExplosion/SmallExplosion.tscn")

const EA_1X7_LINE = preload("res://Bombs/Effects/ExplosionShapes/ExplosionShape1x7Line.tscn")
const EA_3X3_SQUARE = preload("res://Bombs/Effects/ExplosionShapes/ExplosionShape3x3Square.tscn")
const EA_5X5_CROSS = preload("res://Bombs/Effects/ExplosionShapes/ExplosionShape5x5Cross.tscn")
const EA_5X5_SQUARE = preload("res://Bombs/Effects/ExplosionShapes/ExplosionShape5x5Square.tscn")
const EA_5X5_X = preload("res://Bombs/Effects/ExplosionShapes/ExplosionShape5x5X.tscn")
const EA_7X1_LINE = preload("res://Bombs/Effects/ExplosionShapes/ExplosionShape7x1Line.tscn")

var explosion_shapes = [
	EA_1X7_LINE,
	EA_7X1_LINE,
	EA_3X3_SQUARE,
	EA_5X5_SQUARE,
	EA_5X5_CROSS,
	EA_5X5_X,
]

var next_bomb_shape = 0;


func _ready() -> void:
	Global.spawn_bomb.connect(_spawn_bomb)
	Global.spawn_big_explosion.connect(_spawn_big_explosion)
	Global.spawn_small_explosion.connect(_spawn_small_explosion)


func set_new_bomb_shape() -> void:
	next_bomb_shape = randi_range(0, len(explosion_shapes) - 1)
	Global.signal_next_bomb_shape.emit(next_bomb_shape)


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
	var explosion_shape = explosion_shapes[next_bomb_shape].instantiate()
	bomb.set_explosion_shape(explosion_shape)
	add_child(bomb)
	set_new_bomb_shape()


func _spawn_big_explosion(bomb_position: Vector2) -> void:
	var explosion = BIG_EXPLOSION_SCENE.instantiate()
	explosion.global_position = bomb_position
	add_child(explosion)


func _spawn_small_explosion(bomb_position: Vector2) -> void:
	var explosion = SMALL_EXPLOSION_SCENE.instantiate()
	explosion.global_position = bomb_position
	add_child(explosion)
