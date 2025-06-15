class_name ObstacleBase
extends Area3D

@onready var player: Player

func trigger() -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		player = body
		player.callout_pressed.connect(trigger)


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		player.callout_pressed.disconnect(trigger)
		player = null
