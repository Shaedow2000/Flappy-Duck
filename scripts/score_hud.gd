class_name ScoreHUD
extends CanvasLayer

func change_score(score: int) -> void:
	$Label.text = "Score: " + str(score)
