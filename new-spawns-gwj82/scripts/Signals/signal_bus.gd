extends Node

signal callout_connected
signal item_collected(item_caller: ItemBase)

# Dummy signals to remove warnings.
func _ready() -> void:
	if false:
		emit_signal("callout_connected")
		emit_signal("item_collected")
