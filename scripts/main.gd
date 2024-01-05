extends Node2D

@onready var score_label = $UIMain/CenterContainer/ScoreLabel
@onready var health = $UIMain/PanelContainer/Control/ProgressBar

var enemies: PackedScene = preload("res://scenes/follower_enemy.tscn")

@onready var start_time = Time.get_unix_time_from_system()


func _ready():
	new_game()
	
	SignalBus.connect("enemy_hit", _on_hit_player_complete)
	SignalBus.connect("update_health_changed", update_health)


func new_game():
	Globals.health = 100
	Globals.score = 0
	$StartTimer.start()
	$UIMain.show_message("Let's start...")
	

func game_over():
	$ScoreTimer.stop()
	$FollowerEnemyTimer.stop()
	
	var time_now = Time.get_unix_time_from_system()
	
	Globals.global_time = int( time_now - start_time )
	
	$UIMain.show_game_over()


func update_score(_score: int) -> void:
	score_label.text = str(Globals.score)
	
	var tween = get_tree().create_tween()
	tween.tween_property(score_label, "theme_override_font_sizes/font_size", 256, 0.2)
	tween.tween_property(score_label, "theme_override_font_sizes/font_size", 128, 0.2)


func update_health(new_value: int) -> void:
	health.value = new_value


func reset_ball() -> void:
	$PongBall.position = Vector2(544,288)


func _on_score_timer_timeout():
	Globals.score += 1
	update_score(Globals.score)


func _on_start_timer_timeout():
	$ScoreTimer.start()
	$FollowerEnemyTimer.start()


func _on_player_point_area_body_entered(body):
	if body == $PongBall:
		Globals.score -= 10
		update_score(Globals.score)
		reset_ball()
		Globals.health -= 10
		SignalBus.shake_medium.emit()
	
	if Globals.health <= 0:
		game_over()


func _on_enemy_point_area_body_entered(body):
	if body == $PongBall:
		Globals.score += 10
		update_score(Globals.score)
		reset_ball()
		SignalBus.shake_medium.emit()


func _on_hit_player_complete():
	Globals.score += 20
	update_score(Globals.score)


func _on_follower_enemy_timer_timeout():
	var enemy = enemies.instantiate()
	
	var enemy_spawn = $EnemySpawns.get_children()
	
	var selected_enemy_spawn = enemy_spawn[randi() % enemy_spawn.size()]
	
	enemy.position = selected_enemy_spawn.position
	
	add_child(enemy)
	
	
