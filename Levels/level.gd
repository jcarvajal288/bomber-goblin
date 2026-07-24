extends Node

const PLAYER_SCENE = preload("res://Actors/Sapper/Sapper.tscn")

var starting_location: Vector2 = Vector2.ZERO


func _ready() -> void:
	Global.respawn_player.connect(_respawn_player)
	starting_location = $PlayerStartMarker.global_position
	$PlayerStartMarker.queue_free()
	spawn_player()


func spawn_player() -> void:
	var player = PLAYER_SCENE.instantiate()
	player.global_position = starting_location
	Global.player = player
	add_child(player)


func _respawn_player() -> void:
	spawn_player()
	var score_deduction = ScoreTracker.score * 0.1
	ScoreTracker.add_score.emit(score_deduction, Global.player.global_position, -1)