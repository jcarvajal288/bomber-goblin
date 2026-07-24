extends CharacterBody2D

const speed = 25

@export var data: Resource

@onready var has_exploded = false


func _ready() -> void:
	$StateMachine.init(self)
	$AttackCircle.body_entered.connect(_on_body_entered)
	Global.enemies_left += 1


func on_explosion(multiplier: int) -> void:
	ScoreTracker.add_score.emit(data.base_value, global_position, multiplier)
	$StateMachine.change_state($StateMachine/Die)


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.call("die")
