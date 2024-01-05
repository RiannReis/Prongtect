extends CanvasLayer

var game_over_scene: PackedScene = preload("res://scenes/game_over_ui.tscn")

func show_message(text: String) -> void:
	$MarginContainer/Message.text = text
	$MarginContainer/Message.show()
	$MessageTimer.start()


func show_game_over() -> void:
	show_message("YOU DIED!")
	
	await $MessageTimer.timeout
	
	get_tree().change_scene_to_packed(game_over_scene)
	


func _on_message_timer_timeout():
	$MarginContainer/Message.hide()
