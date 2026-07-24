extends Node2D

var speed: float = TAU
var min_alpha: float = 0.2
var max_alpha: float = 1.0

var time: float = 0.0

signal explosion_finished

func _ready() -> void:
	z_index = Global.RenderOrder.INDICATOR
	for child in get_children():
		child.z_index = Global.RenderOrder.INDICATOR
		child.z_as_relative = false


func tick_up_color() -> void:
	for child in get_children():
		child.frame += 1
		child.z_index += 1


func _process(delta: float) -> void:
	time = fmod(time + delta * speed, TAU)	
	var sine_val: float = (sin(time) + 1.0) / 2.0
	var new_a = lerp(min_alpha, max_alpha, sine_val)
	var has_children = false
	for child in get_children():
		child.modulate.a = new_a
		has_children = true
	if not has_children:
		explosion_finished.emit()
	

func can_see_center(node: Node2D) -> bool:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(node.global_position, global_position)
	query.collision_mask = 4
	var result = space_state.intersect_ray(query)
	return result.is_empty()
	


func explode(multiplier: int) -> void:
	var current_order = 0
	while get_children():
		var batch = get_children().filter(func(tile): return tile.explosion_order == current_order)
		for tile in batch:
			if can_see_center(tile):
				tile.explode(multiplier)
			else:
				tile.queue_free()
		current_order += 1
		await Global.wait_for_sec(0.15)
