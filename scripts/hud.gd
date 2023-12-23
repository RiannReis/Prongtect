extends CanvasLayer

@export var main_scene: PackedScene = preload("res://scenes/main.tscn")


func show_message(text: String) -> void:
	$MarginContainer/Message.text = text
	$MarginContainer/Message.show()
	$MessageTimer.start()


func show_game_over() -> void:
	show_message("Game Over!")
	
	await $MessageTimer.timeout
	
	$MarginContainer/Message.text = "Your Score: "
	$MarginContainer/Message.show()
	
	await get_tree().create_timer(1.0).timeout
	
	$VBoxContainer/ButtonNewGame.show()
	$VBoxContainer/ButtonExitGame.show()


func _on_message_timer_timeout():
	$MarginContainer/Message.hide()


func _on_button_new_game_pressed():
	get_tree().change_scene_to_packed(main_scene)


func _on_button_exit_game_pressed():
	get_tree().quit()
