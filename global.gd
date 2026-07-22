extends Node

var player: CharacterBody2D = null

enum RenderOrder {
	FLOOR = 1,
	WALL = 2,
	PLAYER = 5,
}

enum CollisionLayer {
	PLAYER = 1,
	ENEMY = 2,
	ITEM = 3,
	WALL = 4
}