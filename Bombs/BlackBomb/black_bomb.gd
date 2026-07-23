extends Node2D

@export var explosion_area: Node2D

var has_exploded = false


func _ready() -> void:
	$Timer.timeout.connect(tick_down)
	explosion_area.explosion_finished.connect(queue_free)
	z_index = Global.RenderOrder.ITEM


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
