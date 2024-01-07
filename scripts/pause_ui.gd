extends CanvasLayer


func _ready():
	visible = false


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		visible = true
		get_tree().paused = true



func _on_button_resume_pressed():
	get_tree().paused = false
	visible = false


func _on_button_home_pressed():
	get_tree().change_scene_to_file("res://scenes/hud.tscn")
