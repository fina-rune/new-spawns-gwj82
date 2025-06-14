class_name AirState

extends State

@export var landing_state: State
@export var move_animation: String = "Move"
@export var landing_animation: String = "Land"

func state_process(delta: float) -> void:
	if player.is_on_floor():
		next_state = landing_state
		
func on_exit() -> void:
	if next_state == landing_state:
		playback.travel(landing_animation)
