class_name DialogueState
extends State

@export var ground_state: State

func enter() -> void:
	var timeline_map: Dictionary[int, String] = {
		1: "timeline2",
		2: "timeline3",
		3: "timeline4"
	}
	var timeline_name: String = timeline_map.get(character.collected_items, "timeline1")

	Dialogic.start(timeline_name)
	Dialogic.timeline_ended.connect(_on_dialogue_finished, CONNECT_ONE_SHOT)

func _on_dialogue_finished() -> void:
	character.move = true
	Transitioned.emit(self, ground_state.name)

func exit() -> void:
	character.dialogue = false
