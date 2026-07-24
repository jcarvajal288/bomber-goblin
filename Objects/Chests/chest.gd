extends Barrel


func _ready() -> void:
	super()
	Global.chests_left += 1


func explode(multiplier: int) -> void:
	Global.chests_left -= 1
	super(multiplier)
	Sounds.play_sound.emit(Sounds.SoundEffect.TREASURE_EXPLOSION, global_position)