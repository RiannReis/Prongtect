extends Control


func _on_button_replay_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_button_home_pressed():
	get_tree().change_scene_to_file("res://scenes/hud.tscn")
