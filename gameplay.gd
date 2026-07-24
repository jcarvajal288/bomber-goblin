extends Node

var END_SCREEN_SCENE: PackedScene = preload("res://UI/EndScreen/EndScreen.tscn")
var PAUSE_SCREEN_SCENE: PackedScene = preload("res://UI/PauseScreen/PauseScreen.tscn")

@export var levels: Array[PackedScene] = []
@export var starting_level = 0

var current_level: Node = null


func _ready() -> void:
	$BombSpawner.set_new_bomb_shape()
	Global.pause_game.connect(pause_game)
	Global.signal_victory.connect(_on_victory)
	Global.signal_defeat.connect(_on_defeat)
	Global.restart_stage.connect(_restart_stage)
	start_level(starting_level)


func start_level(level_index: int) -> void:
	if current_level != null:
		current_level.queue_free()
	var level = levels[level_index].instantiate()
	current_level = level
	add_child(level)


func _on_victory() -> void:
	await Global.wait_for_sec(1.0)
	pause_game(true)
	var victory_screen = END_SCREEN_SCENE.instantiate()
	victory_screen.did_player_win = true
	add_child(victory_screen)


func _on_defeat() -> void:
	await Global.wait_for_sec(1.0)
	pause_game(true)
	var defeat_screen = END_SCREEN_SCENE.instantiate()
	defeat_screen.did_player_win = false
	add_child(defeat_screen)


func pause_game(should_pause: bool) -> void:
	if should_pause:
		set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	else:
		set_deferred("process_mode", Node.PROCESS_MODE_INHERIT)


func _restart_stage() -> void:
	pause_game(false)
	$BombSpawner.cleanup()
	start_level(starting_level)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pause_game(true)
		var pause_screen = PAUSE_SCREEN_SCENE.instantiate()
		add_child(pause_screen)