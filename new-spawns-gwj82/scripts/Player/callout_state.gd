class_name CalloutState
extends State

@export var callout_animation: String = "callout"
@export var ground_state: State
@export var dialogue_state: State

func exit() -> void:
	animation_tree.set("parameters/conditions/callout", false)

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == callout_animation:
		if character.overlapped_item:
			SignalBus.callout_connected.emit()
			Transitioned.emit(self, ground_state.name)
			animation_tree.set("parameters/conditions/move", true)
		else:
			Transitioned.emit(self, dialogue_state.name)
			animation_tree.set("parameters/conditions/dialogue", true)
