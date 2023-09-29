extends Node

signal score_changed(score: int)

var score: int = 0

func get_score():
	return score
	
func increase_score():
	score += 1
	score_changed.emit(score)
