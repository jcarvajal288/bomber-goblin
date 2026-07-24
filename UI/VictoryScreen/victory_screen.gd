extends CanvasLayer


func _process(_delta: float) -> void:
	if Input.is_action_pressed("restart_stage"):
		Global.restart_stage.emit()
		queue_free()
