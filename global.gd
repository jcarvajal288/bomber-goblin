extends Node

const TILE_SIZE: int = 16

var player: CharacterBody2D = null

enum RenderOrder {
	FLOOR = 1,
	WALL = 2,
	INDICATOR = 3,
	ITEM = 8,
	PLAYER = 10,
	SCORE_TOAST = 20
}

enum CollisionLayer {
	PLAYER = 1,
	ENEMY = 2,
	ITEM = 3,
	WALL = 4
}

@warning_ignore_start("unused_signal")
signal respawn_player
signal signal_next_bomb_shape(next_bomb_shape: int)
signal spawn_bomb(bomb_position: Vector2)
signal spawn_big_explosion(bomb_position: Vector2)
signal spawn_small_explosion(explosion_position: Vector2)
@warning_ignore_restore("unused_signal")

func wait_for_sec(secs: float) -> void:
	await get_tree().create_timer(secs).timeout


var chests_left: int = 0