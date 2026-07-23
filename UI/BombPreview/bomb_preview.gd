extends TextureRect

const FRAME_WIDTH = 56
const FRAME_HEIGHT = 56

var next_bomb_shape: int = 0


func _ready() -> void:
	Global.signal_next_bomb_shape.connect(change_next_bomb_shape)


func change_next_bomb_shape(new_area: int) -> void:
	next_bomb_shape = new_area
	var atlas_tex = texture as AtlasTexture
	var new_x = next_bomb_shape * FRAME_WIDTH
	atlas_tex.region = Rect2(new_x, 0, FRAME_WIDTH, FRAME_HEIGHT)
