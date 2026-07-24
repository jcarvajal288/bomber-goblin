extends Node

@export var levels: Array[PackedScene] = []
@export var starting_level = 0

var current_level: Node = null


func _ready() -> void:
	$BombSpawner.set_new_bomb_shape()
	Global.signal_victory.connect(_on_victory)
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


func pause_game(should_pause: bool) -> void:
	if should_pause:
		set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	else:
		set_deferred("process_mode", Node.PROCESS_MODE_INHERIT)