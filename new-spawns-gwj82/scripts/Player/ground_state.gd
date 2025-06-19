class_name GroundState
extends State

@export var jump_velocity: float = 4.5

@export var air_state: State
@export var callout_state: State

func exit() -> void:
	character.move = false

func physics_update(_delta: float) -> void:
	if not character.is_on_floor():
		Transitioned.emit(self, air_state.name)

	if Input.is_action_just_pressed("jump"):
		character.velocity.y += jump_velocity
		Transitioned.emit(self, air_state.name)
		
	if Input.is_action_just_pressed("callout"):
		Transitioned.emit(self, callout_state.name)
		character.callout = true
