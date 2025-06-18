extends CanvasLayer

@onready var dialogue_panel: PanelContainer = $DialoguePanel

func toggle_dialogue() -> void:
	if dialogue_panel:
		dialogue_panel.visible = not dialogue_panel.visible
