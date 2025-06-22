extends StaticBody3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		call_deferred("to_ending_screen")
		

func to_ending_screen() -> void:
	get_tree().change_scene_to_file("res://scenes/Ending/ending_screen.tscn")
	MusicManager.stop_music()
