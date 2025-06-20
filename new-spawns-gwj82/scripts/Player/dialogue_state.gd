class_name DialogueState
extends State

@export var ground_state: State

var timelines_to_play: Array[String] = []
var current_index: int = 0

func enter() -> void:
	timelines_to_play.clear()
	current_index = 0

	var timeline_map: Dictionary = {
		0: "timeline1",
		1: "timeline2",
		2: "timeline3",
		3: "timeline4"
	}

	var max_timeline: int = min(character.collected_items, 3)

	if character.dialogue_index > max_timeline:
		# replay only most recent unlocked timeline
		if timeline_map.has(max_timeline):
			timelines_to_play.append(timeline_map[max_timeline])
	else:
		for i in range(character.dialogue_index, max_timeline + 1):
			if timeline_map.has(i):
				timelines_to_play.append(timeline_map[i])
	# exit if no timelines in queue 
	if timelines_to_play.is_empty():
		character.dialogue = false
		character.move = true
		Transitioned.emit(self, ground_state.name)
		return

	_play_next_timeline()


func _play_next_timeline() -> void:
	if current_index >= timelines_to_play.size():
		character.dialogue_index = max(character.dialogue_index, character.collected_items + 1)
		character.move = true
		Transitioned.emit(self, ground_state.name)
		return

	var timeline_name: String = timelines_to_play[current_index]
	current_index += 1

	Dialogic.start(timeline_name)
	Dialogic.timeline_ended.connect(_play_next_timeline, CONNECT_ONE_SHOT)


func _on_dialogue_finished() -> void:
	# update dialogue_index to next timeline
	character.dialogue_index = character.collected_items + 1
	character.move = true
	Transitioned.emit(self, ground_state.name)

func exit() -> void:
	character.dialogue = false
