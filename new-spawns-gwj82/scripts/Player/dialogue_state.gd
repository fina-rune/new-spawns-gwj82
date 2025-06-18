class_name DialogueState
extends State

@export var ground_state: State
@export var ground_animation_name: String = "Move"

@export var dialog_panel: Control

func on_enter() -> void:
	Dialogue.toggle_dialogue()

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("callout"):
		Dialogue.toggle_dialogue()
		next_state = ground_state
		playback.travel(ground_animation_name)
