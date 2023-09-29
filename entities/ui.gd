extends CanvasLayer
class_name UI

@onready var score_text = $Control/MarginContainer/VBoxContainer/ScoreText

func _ready():
	PlayerData.score_changed.connect(self._on_collected)
	_update_score_label()

func _update_score_label():
	score_text.text = "Score: " + str(PlayerData.get_score())
	
func _on_collected(score: int) -> void:
	print("_on_collected")
	_update_score_label()
	
