class_name BlackBomb extends StaticBody2D

@export var data: Resource

var explosion_shape: Node2D

var has_exploded = false


func _ready() -> void:
	$Timer.timeout.connect(tick_down)
	z_index = Global.RenderOrder.ITEM


func set_explosion_shape(ea: Node2D) -> void:
	explosion_shape = ea
	explosion_shape.explosion_finished.connect(queue_free)
	explosion_shape.z_index = Global.RenderOrder.INDICATOR
	add_child(explosion_shape)


func tick_down() -> void:
	if $Sprite2D.frame < 8:
		$Sprite2D.frame += 1
		if $Sprite2D.frame == 3 or $Sprite2D.frame == 6:
			explosion_shape.tick_up_color()
	elif not has_exploded:
		explode(0)


func explode(multiplier: int) -> void:
	has_exploded = true
	Global.spawn_big_explosion.emit(global_position)
	explosion_shape.explode(multiplier)
	ScoreTracker.add_score.emit(data.base_value, global_position, multiplier)
	Sounds.play_sound.emit(Sounds.SoundEffect.BOMB_EXPLOSION, global_position)


func on_explosion(multiplier: int) -> void:
	explode(multiplier + 1)
