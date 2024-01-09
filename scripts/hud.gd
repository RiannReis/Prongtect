extends CanvasLayer

@export var main_scene: PackedScene = preload("res://scenes/main.tscn")

var control_screen: PackedScene = preload("res://scenes/ui_controls_guide.tscn")

var credits_scene: PackedScene = preload("res://scenes/ui_credits.tscn")


func _ready():
	MainAudio.play()


func _on_button_new_game_pressed():
	get_tree().change_scene_to_packed(main_scene)


func _on_button_controls_pressed():
	var control_sc_added = control_screen.instantiate()
	get_tree().current_scene.add_child(control_sc_added)


func _on_button_exit_game_pressed():
	get_tree().quit()


func _on_button_credits_pressed():
	var credit_sc_added = credits_scene.instantiate()
	get_tree().current_scene.add_child(credit_sc_added)
