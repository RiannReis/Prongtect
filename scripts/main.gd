extends Node2D

var score


func new_game():
	score = 0
	$StartTimer.start()


func game_over():
	$ScoreTimer.stop()


func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)


func _on_score_timer_timeout():
	score += 1
	update_score(score)


func _on_start_timer_timeout():
	$ScoreTimer.start()

