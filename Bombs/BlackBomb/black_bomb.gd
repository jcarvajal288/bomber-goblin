class_name BlackBomb extends StaticBody2D

const BASE_SCORE = 50

var explosion_shape: Node2D

var has_exploded = false


func _ready() -> void:
	$Timer.timeout.connect(tick_down)
	z_index = Global.RenderOrder.ITEM


func set_explosion_shape(ea: Node2D) -> void:
	explosion_shape = ea
	explosion_shape.explosion_finished.connect(queue_free)
	add_child(explosion_shape)


func tick_down() -> void:
	if $Sprite2D.frame < 8:
		$Sprite2D.frame += 1
		if $Sprite2D.frame == 3 or $Sprite2D.frame == 6:
			explosion_shape.tick_up_color()
	elif not has_exploded:
		explode()


func explode() -> void:
	has_exploded = true
	Global.spawn_big_explosion.emit(global_position)
	explosion_shape.explode()
	Global.score += BASE_SCORE


func on_explosion() -> void:
	explode()
