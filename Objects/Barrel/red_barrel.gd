extends Barrel

func _ready() -> void:
	super()
	$ExplosionShape3x3Square.explosion_finished.connect(queue_free)


func explode(multiplier: int) -> void:
	has_exploded = true
	Global.spawn_big_explosion.emit(global_position)
	$ExplosionShape3x3Square.explode(multiplier)
	ScoreTracker.add_score.emit(data.base_value, global_position, multiplier)


func on_explosion(multiplier: int) -> void:
	explode(multiplier + 1)