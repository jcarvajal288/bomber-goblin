class_name Barrel extends StaticBody2D

const BASE_SCORE = 100


var has_exploded = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = Global.RenderOrder.ITEM


func explode() -> void:
	has_exploded = true
	Global.spawn_big_explosion.emit(global_position)
	ScoreTracker.add_score.emit(BASE_SCORE, global_position)
	queue_free()


func on_explosion() -> void:
	explode()