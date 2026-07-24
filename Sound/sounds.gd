extends Node

@warning_ignore_start("unused_signal")
signal play_sound(sound_effect: SoundEffect, sound_position: Vector2)
@warning_ignore_restore("unused_signal")

enum SoundEffect {
	BOMB_EXPLOSION,
	BARREL_EXPLOSION,
	TREASURE_EXPLOSION,
	RED_BARREL_EXPLOSION,
	DWARF_FIGHTER_ATTACK,
	DWARF_FIGHTER_DEATH,
	SAPPER_DEATH,
}