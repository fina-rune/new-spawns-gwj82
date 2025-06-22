extends Area3D

@export var item: ItemBase

func _ready() -> void:
	SignalBus.item_collected.connect(on_item_collected)

func _on_body_entered(body: Node3D) -> void:
	$PlayerDamage.play()
	if body.is_in_group("player"):
		body.can_move = false
		await $PlayerDamage.finished
		call_deferred("reload_scene_deferred")

func reload_scene_deferred() -> void:
	get_tree().reload_current_scene()

func on_item_collected(item_caller: ItemBase) -> void:
	if item_caller == item:
		queue_free()
