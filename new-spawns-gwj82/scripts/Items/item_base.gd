class_name ItemBase
extends Area3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape: CollisionShape3D = $CollisionShape3D

@export var amplitude: float = 0.1
@export var floating_speed: float = 3.0
@export var collision_shape_scale: Vector3 = Vector3.ONE
@export var next_item: ItemBase

var running_time: float = 0.0
var previous_y_offset: float = 0.0
signal item_collected

func _ready() -> void:
	collision_shape.scale = collision_shape_scale

func _process(delta: float) -> void:
	running_time += delta
	
	var current_y_offset: float = amplitude * sin(running_time * floating_speed)
	var delta_y: float = current_y_offset - previous_y_offset
	
	var new_position: Vector3 =  global_position
	new_position.y += delta_y
	global_position = new_position
	
	previous_y_offset = current_y_offset

func trigger() -> void:
	if animation_player:
		animation_player.play("warp_out")
		item_collected.emit()
		await animation_player.animation_finished
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	if (body.is_in_group("player") 
	and body.has_method("set_overlapped_item")):
		SignalBus.callout_connected.connect(trigger)
		body.set_overlapped_item(self)


func _on_body_exited(body: Node3D) -> void:
	if (body.is_in_group("player") 
	and body.has_method("set_overlapped_item")
	and SignalBus.callout_connected.is_connected(trigger)):
		SignalBus.callout_connected.disconnect(trigger)
		body.set_overlapped_item(null)

func _exit_tree() -> void:
	SignalBus.item_collected.emit(self)
	if next_item:
		next_item.visible = true
