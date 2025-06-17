class_name GroundState

extends State

@export var jump_velocity: float = 4.5

@export var air_state: State
@export var callout_state: State

@export var jump_animation: String = "Jump"
@export var callout_animation: String = "Callout"

func state_process(_delta: float) -> void:
	if !player.is_on_floor():
		to_jump_state()

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and player.is_on_floor():
		player.velocity.y = jump_velocity
		to_jump_state()
		
	if event.is_action_pressed("callout") and player.is_on_floor():
		to_callout_state()

func to_jump_state() -> void:
	next_state = air_state
	playback.travel(jump_animation)

func to_callout_state() -> void:
	next_state = callout_state
	playback.travel(callout_animation)
