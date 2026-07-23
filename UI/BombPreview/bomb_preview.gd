extends MarginContainer

const FRAME_WIDTH = 49

var next_bomb_area: int = 0


func _ready() -> void:
	Global.signal_next_bomb_area.connect(change_next_bomb_area)


func change_next_bomb_area(new_area: int) -> void:
	next_bomb_area = new_area
	var atlas_tex = $PanelContainer/TextureRect.texture as AtlasTexture
	var new_x = next_bomb_area * FRAME_WIDTH
	atlas_tex.region = Rect2(new_x, 0, FRAME_WIDTH, FRAME_WIDTH)