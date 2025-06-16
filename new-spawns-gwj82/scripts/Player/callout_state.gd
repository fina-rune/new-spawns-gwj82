extends State

@export var callout_animation: String = "callout"
@export var ground_state: State

func on_enter() -> void:
	SignalBus.callout_connected.emit()


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == callout_animation:
		next_state = ground_state
