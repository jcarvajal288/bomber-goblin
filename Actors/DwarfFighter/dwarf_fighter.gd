extends CharacterBody2D

const speed = 40


func _ready() -> void:
	$StateMachine.init(self)