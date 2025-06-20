class_name LandingState

extends State

@export var landing_animation_name: String = "land"
@export var ground_state: State

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == landing_animation_name:
		Transitioned.emit(self, ground_state.name)
