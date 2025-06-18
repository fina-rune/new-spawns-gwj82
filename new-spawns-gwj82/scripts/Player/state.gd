class_name State
extends Node

signal Transitioned

@export var can_move: bool = true

var animation_tree: AnimationTree
var character: CharacterBody3D

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass
