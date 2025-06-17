class_name DialogueState
extends State

@export var ground_state: State
@export var ground_animation_name: String = "Move"

@export var dialog_panel: Control

func on_enter() -> void:
	print("Showing dialogue")
	if dialog_panel:
		dialog_panel.visible = true

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("callout"):
		print("Showing/hiding dialog...")
		if dialog_panel:
			print("Hiding dialog...")
			dialog_panel.visible = false
			next_state = ground_state
			playback.travel(ground_animation_name)
