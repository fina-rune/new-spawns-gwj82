class_name DialogueState
extends State

@export var ground_state: State

var dialog_panel: Control

func enter() -> void:
	dialog_panel = get_node("/root/World/DialogCanvas/DialogPanel")
	if dialog_panel:
		dialog_panel.visible = true

func exit() -> void:
	character.dialogue = false

func physics_update(_delta: float) -> void:
	if Input.is_action_pressed("callout"):
		if dialog_panel:
			dialog_panel.visible = false
			Transitioned.emit(self, ground_state.name)
			character.move = true
