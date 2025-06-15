class_name GroundState

extends State

@export var jump_velocity: float = 4.5
@export var air_state: State
@export var jump_animation: String = "Jump"

func state_process(delta: float) -> void:
	if !player.is_on_floor():
		next_state = air_state

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and player.is_on_floor():
		jump()

func jump() -> void:
	player.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
