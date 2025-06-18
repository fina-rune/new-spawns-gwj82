class_name AirState
extends State

@export var landing_state: State

func physics_update(_delta: float) -> void:
	if character.is_on_floor():
		Transitioned.emit(self, landing_state.name)
