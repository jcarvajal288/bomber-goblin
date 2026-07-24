extends Node

@warning_ignore_start("unused_signal")
signal play_sound(sound_effect: SoundEffect, sound_position: Vector2)
@warning_ignore_restore("unused_signal")

enum SoundEffect {
	EXPLOSION_5,
}