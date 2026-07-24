extends CanvasLayer


func _process(_delta: float) -> void:
	print("processing")
	if Input.is_action_pressed("restart_stage"):
		print("restarting stage")
		Global.restart_stage.emit()
		queue_free()
