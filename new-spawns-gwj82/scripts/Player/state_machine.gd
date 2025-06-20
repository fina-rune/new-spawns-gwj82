class_name StateMachine
extends Node

@export var animation_tree: AnimationTree
@export var initial_state: State
@export var character: CharacterBody3D

var current_state: State

var states: Dictionary[StringName, State] = {}

func _ready() -> void:
	for child: Node in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			if character and animation_tree:
				child.character = character
				child.animation_tree = animation_tree
		
		if initial_state:
			initial_state.enter()
			current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state: State, new_state_name: StringName) -> void:
	if state != current_state:
		return
		
	var new_state: State = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	if current_state:
		current_state.exit()
		
	new_state.enter()
	current_state = new_state

func can_character_move() -> bool:
	return current_state.can_move
