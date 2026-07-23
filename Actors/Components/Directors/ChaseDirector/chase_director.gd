extends Director

const attack_distance = 20


func _process(_delta: float) -> void:
	var destination = Global.player.global_position
	movement_vector = subject.global_position.direction_to(destination)
