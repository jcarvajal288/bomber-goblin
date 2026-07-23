extends Node2D

var explosion_area: Node2D

var has_exploded = false


func _ready() -> void:
	$Timer.timeout.connect(tick_down)
	z_index = Global.RenderOrder.ITEM


func set_explosion_area(ea: Node2D) -> void:
	explosion_area = ea
	# explosion_area.global_position = global_position
	explosion_area.explosion_finished.connect(queue_free)
	add_child(explosion_area)


func tick_down() -> void:
	if $Sprite2D.frame < 8:
		$Sprite2D.frame += 1
		if $Sprite2D.frame == 3 or $Sprite2D.frame == 6:
			explosion_area.tick_up_color()
	elif not has_exploded:
		explode()
		has_exploded = true


func explode() -> void:
	Global.spawn_big_explosion.emit(global_position)
	explosion_area.explode()
