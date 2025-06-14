extends CenterContainer


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_pressed() -> void:
	var loading_screen: Resource = load("res://scenes/UI/loading_screen.tscn")
	get_tree().change_scene_to_packed(loading_screen)
