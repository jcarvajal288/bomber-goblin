extends Sprite2D


func _ready() -> void:
	$Area2D.monitoring = false
	$Area2D.body_entered.connect(_on_body_entered)


func explode() -> void:
	visible = false
	Global.spawn_small_explosion.emit(global_position)
	$Area2D.monitoring = true
	await Global.wait_for_sec(0.1)
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("on_explosion") and not body.has_exploded:
		body.call("on_explosion")
