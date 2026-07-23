extends Director

const attack_distance = 20


func _process(_delta: float) -> void:
	if not Global.player or Global.player.has_exploded:
		movement_vector = Vector2.ZERO
	else:
		var destination = Global.player.global_position
		movement_vector = subject.global_position.direction_to(destination)
