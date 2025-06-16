class_name StateMachine

extends Node

@export var player: CharacterBody3D
@export var current_state: State
@export var animation_tree: AnimationTree

var states: Array[State]

func _ready() -> void:
	for child: Node in get_children():
		if child is State:
			states.append(child)
			child.player = player
			child.playback = animation_tree["parameters/playback"]
			
		else:
			push_warning("Child " + child.name + " is not a State in StateMachine.")

func _physics_process(delta: float) -> void:
	if current_state.next_state:
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)


func can_player_move() -> bool:
	return current_state.can_move

func switch_states(new_state: State) -> void:
	if current_state:
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	current_state.on_enter()

func _input(event: InputEvent) -> void:
	current_state.state_input(event)
