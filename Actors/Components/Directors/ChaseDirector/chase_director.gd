extends Director

const attack_distance = 20
const chase_distance = (10 * Global.TILE_SIZE) ** 2


func _process(_delta: float) -> void:
	if should_stop():
		movement_vector = Vector2.ZERO
	else:
		var destination = Global.player.global_position
		movement_vector = subject.global_position.direction_to(destination)


func should_stop() -> bool:
	var distance_to_player = subject.global_position.distance_squared_to(Global.player.global_position)
	return not Global.player or Global.player.has_exploded or distance_to_player > chase_distance
