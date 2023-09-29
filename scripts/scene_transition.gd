extends ColorRect
class_name SceneFadeTransition

@onready var _anim_player := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Plays the animation backward to fade in
	_anim_player.play_backwards("Fade")
	print("noo")

func transition_to(_next_scene: PackedScene) -> void:
	# Plays the Fade animation and wait until it finishes
	_anim_player.play("Fade")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_packed(_next_scene)
	print("yep")
