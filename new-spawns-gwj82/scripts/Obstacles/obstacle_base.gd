class_name ObstacleBase
extends Area3D

@onready var player: Player

func _ready() -> void:
	# Connect signals so that Godot calls your functions
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func trigger() -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		player = body
		player.callout_pressed.connect(trigger)
		player.is_near_collectible = true
		print("Player entered collectible area")


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		player.callout_pressed.disconnect(trigger)
		player.is_near_collectible = false
		player = null
		print("Player exited collectible area")
