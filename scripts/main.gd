extends Node2D

var score: int

@onready var score_label = $CanvasLayer/CenterContainer/ScoreLabel
@onready var health = $CanvasLayer/PanelContainer/Control/ProgressBar

var enemies: PackedScene = preload("res://scenes/follower_enemy.tscn")

func _ready():
	new_game()
	SignalBus.connect("enemy_hit", _on_hit_player_complete)
	SignalBus.connect("update_health_changed", update_health)


func new_game():
	score = 0
	$StartTimer.start()
	

func game_over():
	$ScoreTimer.stop()
	$FollowerEnemyTimer.stop()


func update_score(_score: int) -> void:
	score_label.text = str(score)
	var tween = get_tree().create_tween()
	tween.tween_property(score_label, "theme_override_font_sizes/font_size", 256, 0.2)
	tween.tween_property(score_label, "theme_override_font_sizes/font_size", 128, 0.2)


func update_health(new_value: int) -> void:
	health.value = new_value


func reset_ball():
	$PongBall.position = Vector2(544,288)


func _on_score_timer_timeout():
	score += 1
	update_score(score)


func _on_start_timer_timeout():
	$ScoreTimer.start()
	$FollowerEnemyTimer.start()


func _on_player_point_area_body_entered(body):
	if body == $PongBall:
		score -= 10
		update_score(score)
		reset_ball()
		Globals.health -= 10
		SignalBus.shake_medium.emit()


func _on_enemy_point_area_body_entered(body):
	if body == $PongBall:
		score += 10
		update_score(score)
		reset_ball()
		SignalBus.shake_medium.emit()


func _on_hit_player_complete():
	score += 20
	update_score(score)


func _on_follower_enemy_timer_timeout():
	var enemy = enemies.instantiate()
	
	var enemy_spawn = $EnemySpawns.get_children()
	
	var selected_enemy_spawn = enemy_spawn[randi() % enemy_spawn.size()]
	
	enemy.position = selected_enemy_spawn.position
	
	add_child(enemy)
	
	
