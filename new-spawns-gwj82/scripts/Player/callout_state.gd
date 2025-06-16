extends State

@export var callout_animation: String = "callout"
@export var ground_state: State

func on_enter() -> void:
	if player.is_near_collectible:
		print("Collecting item...")
		player.callout_pressed.emit()
	else:
		print("Showing/hiding dialog...")
		var dialog_panel: Control = get_node("/root/World/DialogCanvas/DialogPanel")
		if dialog_panel:
			dialog_panel.visible = not dialog_panel.visible
		else:
			print("Dialog panel not found!")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == callout_animation:
		next_state = ground_state
