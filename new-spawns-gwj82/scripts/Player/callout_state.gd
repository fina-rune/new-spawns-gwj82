class_name CalloutState
extends State

@export var callout_animation: String = "callout"
@export var ground_state: State
@export var dialogue_state: State

func exit() -> void:
	character.callout = false

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == callout_animation:
		if character.overlapped_item:
			SignalBus.callout_connected.emit()
			Transitioned.emit(self, ground_state.name)
			character.move = true
		else:
			Transitioned.emit(self, dialogue_state.name)
			character.dialogue = true
