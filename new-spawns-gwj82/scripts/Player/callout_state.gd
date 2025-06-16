extends State

@export var callout_animation: String = "callout"
@export var dialogue_animation_name: String = "Dialogue"
@export var ground_state: State
@export var dialogue_state: State

func on_enter() -> void:
	if player.is_near_collectible:
		print("Collecting item...")
		player.callout_pressed.emit()
	else:
		next_state = dialogue_state
		playback.travel(dialogue_animation_name)

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == callout_animation:
		next_state = ground_state
