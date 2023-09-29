extends Area2D

@export var targetScene : PackedScene
@export var sceneFadeTransition: SceneFadeTransition

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _on_Area2D_body_entered)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		sceneFadeTransition.transition_to(targetScene)
