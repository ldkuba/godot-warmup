extends Node

class_name SoundManager

func get_sound(sound_name: String) -> AudioStreamPlayer:
	for child in get_children():
		if child.name == sound_name:
			return child as AudioStreamPlayer
	push_error("player sound: " + sound_name + " not found")
	return null

func play_sound(sound_name: String, force_restart: bool = false):
	var sound = get_sound(sound_name)
	if sound != null:
		if(force_restart || !sound.is_playing()):
			sound.play()
