extends Barrel


func _ready() -> void:
	super()
	ScoreTracker.chests_left += 1


func explode(multiplier: int) -> void:
	ScoreTracker.chests_left -= 1
	super(multiplier)
	Sounds.play_sound.emit(Sounds.SoundEffect.TREASURE_EXPLOSION, global_position)
	if ScoreTracker.chests_left <= 0:
		Global.signal_victory.emit()
