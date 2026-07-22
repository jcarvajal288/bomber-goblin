extends Node

var player: CharacterBody2D = null

enum RenderOrder {
	FLOOR = 1,
	WALL = 2,
	INDICATOR = 3,
	ITEM = 4,
	PLAYER = 5,
}

enum CollisionLayer {
	PLAYER = 1,
	ENEMY = 2,
	ITEM = 3,
	WALL = 4
}

@warning_ignore_start("unused_signal")
signal spawn_bomb(bomb_position: Vector2)
@warning_ignore_restore("unused_signal")