class_name Sapper extends CharacterBody2D

const speed = 40


func _ready() -> void:
	Global.player = self
	z_index = Global.RenderOrder.PLAYER;
	$StateMachine.init(self)