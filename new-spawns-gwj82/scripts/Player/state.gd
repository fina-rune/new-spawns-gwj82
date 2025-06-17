extends Node

class_name State

@export var can_move: bool = true

var player: CharacterBody3D
var next_state: State
var playback : AnimationNodeStateMachinePlayback

func state_process(_delta: float) -> void:
	pass

func state_input(_event: InputEvent) -> void:
	pass

func on_enter() -> void:
	pass

func on_exit() -> void:
	pass
