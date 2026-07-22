class_name Sapper extends CharacterBody2D

const speed = 40


func _ready() -> void:
	Global.player = self
	z_index = Global.RenderOrder.PLAYER
	$StateMachine.init(self)
	$BombTimer.timeout.connect(drop_bomb)


func drop_bomb() -> void:
	Global.spawn_bomb.emit(global_position)


func on_explosion() -> void:
	$StateMachine.change_state($StateMachine/Die)
