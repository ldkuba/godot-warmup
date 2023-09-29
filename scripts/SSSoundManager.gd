extends Node

class_name SSSoundManager

func get_sound(sound_name: String) -> AudioStreamPlayer:
	for child in get_children():
		if child.name == sound_name:
			return child as AudioStreamPlayer
	push_error("player sound: " + sound_name + " not found")
	return null

func play_sound(sound_name: String):
	var sound = get_sound(sound_name)
	if sound != null && !sound.is_playing():
		sound.play()
