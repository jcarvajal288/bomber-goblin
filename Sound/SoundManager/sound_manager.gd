extends Node


func _ready() -> void:
	Sounds.play_sound.connect(_on_play_sound)


func play_sound_at_position(sound_player: AudioStreamPlayer2D, sound_position: Vector2) -> void:
	sound_player.global_position = sound_position
	sound_player.play()


func _on_play_sound(sound_effect: Sounds.SoundEffect, sound_position: Vector2) -> void:
	if sound_effect == Sounds.SoundEffect.BOMB_EXPLOSION:
		play_sound_at_position($BombExplosion, sound_position)
	elif sound_effect == Sounds.SoundEffect.BARREL_EXPLOSION: 
		play_sound_at_position($BarrelExplosion, sound_position)
	elif sound_effect == Sounds.SoundEffect.TREASURE_EXPLOSION: 
		play_sound_at_position($TreasureExplosion, sound_position)
	elif sound_effect == Sounds.SoundEffect.RED_BARREL_EXPLOSION: 
		play_sound_at_position($RedBarrelExplosion, sound_position)
