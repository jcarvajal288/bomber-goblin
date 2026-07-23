extends CharacterBody2D

const speed = 25

@export var data: Resource

@onready var has_exploded = false


func _ready() -> void:
	$StateMachine.init(self)


func on_explosion(multiplier: int) -> void:
	ScoreTracker.add_score.emit(data.base_value, global_position, multiplier)
	$StateMachine.change_state($StateMachine/Die)