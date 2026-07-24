extends State


func enter() -> void:
	super()
	Global.enemies_left -= 1


func process_frame(_delta: float) -> State:
	if not animation_player.is_playing():
		subject.queue_free()
	return null