extends Area2D

@export var targetScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _on_Area2D_body_entered)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_packed(targetScene)
