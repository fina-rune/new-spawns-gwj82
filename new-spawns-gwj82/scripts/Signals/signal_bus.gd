extends Node

signal callout_connected

# Dummy signals to remove warnings.
func _ready() -> void:
	if false:
		emit_signal("callout_connected")
