extends CanvasLayer

@export var main_scene: PackedScene = preload("res://scenes/main.tscn")

var control_screen: PackedScene = preload("res://scenes/ui_controls_guide.tscn")


func _on_button_new_game_pressed():
	get_tree().change_scene_to_packed(main_scene)


func _on_button_controls_pressed():
	var control_sc_added = control_screen.instantiate()
	get_tree().current_scene.add_child(control_sc_added)


func _on_button_exit_game_pressed():
	get_tree().quit()

