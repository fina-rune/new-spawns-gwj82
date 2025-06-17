class_name ObstacleBase
extends Area3D

func trigger() -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		SignalBus.callout_connected.connect(trigger)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") and SignalBus.callout_connected.is_connected(trigger):
		SignalBus.callout_connected.disconnect(trigger)
