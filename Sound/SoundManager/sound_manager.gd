extends Node


func _ready() -> void:
	Sounds.play_sound.connect(_on_play_sound)


func play_sound_at_position(sound_player: AudioStreamPlayer2D, sound_position: Vector2) -> void:
	sound_player.global_position = sound_position
	sound_player.play()


func _on_play_sound(sound_effect: Sounds.SoundEffect, sound_position: Vector2) -> void:
	print("on play sound")
	if sound_effect == Sounds.SoundEffect.EXPLOSION_5:
		print("playing explosion 5")
		play_sound_at_position($Explosion5, sound_position)