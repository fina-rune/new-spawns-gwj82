class_name GroundState

extends State

@export var jump_velocity: float = 4.5
@export var air_state: State
@export var jump_animation: String = "Jump"


func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		jump()

func jump() -> void:
	player.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
