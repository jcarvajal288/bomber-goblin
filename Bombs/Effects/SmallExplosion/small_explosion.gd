extends AnimatedSprite2D


func _ready() -> void:
	z_index = Global.RenderOrder.ITEM + 1
	animation_finished.connect(queue_free)
	
