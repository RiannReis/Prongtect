extends Control

@onready var score_label = $Panel/VBoxContainer2/MarginContainer4/VBoxContainer/MarginContainer2/HBoxContainer/LabelScore
@onready var time_label = $Panel/VBoxContainer2/MarginContainer4/VBoxContainer/MarginContainer/HBoxContainer/LabelTime
@onready var high_score_label = $Panel/VBoxContainer2/MarginContainer3/HBoxContainer/LabelHighScore


func _ready():
	update_score()
	update_time()
	update_high_score()


func update_high_score() -> void:
	high_score_label.text = str(HighScore.highest_score)


func update_score() -> void:
	score_label.text = str(Globals.score)


func update_time() -> void:
	time_label.text = str(Globals.global_time)


func _on_button_replay_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_button_home_pressed():
	get_tree().change_scene_to_file("res://scenes/hud.tscn")
