extends State


func enter() -> void:
	super()
	subject.has_exploded = true


func process_frame(_delta: float) -> State:
	if not animation_player.is_playing():
		subject.queue_free()
		Global.respawn_player.emit()
	return null