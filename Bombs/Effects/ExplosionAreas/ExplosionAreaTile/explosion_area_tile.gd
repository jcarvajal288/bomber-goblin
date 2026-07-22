extends Sprite2D


func explode() -> void:
	visible = false
	Global.spawn_small_explosion.emit(global_position)