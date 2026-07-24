extends Node

const PLAYER_SCENE = preload("res://Actors/Sapper/Sapper.tscn")


func _ready() -> void:
	Global.respawn_player.connect(_respawn_player)


func _respawn_player() -> void:
	var player = PLAYER_SCENE.instantiate()
	player.global_position = Vector2(265, 238)
	Global.player = player
	add_child(player)
	var score_deduction = ScoreTracker.score * 0.1
	print("deducting %d score" % score_deduction)
	ScoreTracker.add_score.emit(score_deduction, player.global_position, -1)