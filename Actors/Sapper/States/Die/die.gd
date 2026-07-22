extends State


func enter() -> void:
	super()
	subject.is_alive = false


func process_frame(_delta: float) -> State:
	if not animation_player.is_playing():
		subject.queue_free()
	return null