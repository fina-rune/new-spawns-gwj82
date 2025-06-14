class_name AirState

extends State

@export var ground_state: State
@export var move_animation: String = "Move"

func state_process(delta: float) -> void:
	if player.is_on_floor():
		next_state = ground_state
		playback.travel(move_animation)
		
