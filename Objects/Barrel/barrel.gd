class_name Barrel extends StaticBody2D

@export var data: Resource

var has_exploded = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = Global.RenderOrder.ITEM


func explode(multiplier: int) -> void:
	has_exploded = true
	Global.spawn_big_explosion.emit(global_position)
	ScoreTracker.add_score.emit(data.base_value, global_position, multiplier)
	queue_free()


func on_explosion(multiplier: int) -> void:
	explode(multiplier)