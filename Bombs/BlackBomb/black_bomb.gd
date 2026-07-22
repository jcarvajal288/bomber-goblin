extends Node2D


func _ready() -> void:
	$Timer.timeout.connect(tick_down)
	z_index = Global.RenderOrder.ITEM


func tick_down() -> void:
	if $Sprite2D.frame < 8:
		$Sprite2D.frame += 1
	else:
		explode()


func explode() -> void:
	queue_free()
