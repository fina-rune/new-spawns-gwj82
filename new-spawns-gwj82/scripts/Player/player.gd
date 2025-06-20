class_name Player

extends CharacterBody3D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var player_sprite: Sprite3D = $Sprite3D
@onready var state_machine: StateMachine = $"State Machine"


@export var item_counter_label: RichTextLabel
@export var speed: float = 5.0
@export var air_control: float = 0.01

var direction: float

var overlapped_item: ItemBase

var collected_items: int = 0
var total_items: int = 0

var callout: bool = false
var dialogue: bool = false
var move: bool = false


func _ready() -> void:
	animation_tree.active = true
	var items: Array[Node] = get_tree().get_nodes_in_group("collectibles")
	total_items = items.size()
	update_inventory_label()

	for item: ItemBase in items:
		item.item_collected.connect(on_item_collected)

func _physics_process(delta: float) -> void:
	if state_machine.can_character_move():
		if not is_on_floor():
			velocity += get_gravity() * delta

		direction = Input.get_axis("move_left", "move_right")	
		
		var control: float = 1.0 if is_on_floor() else air_control
		if direction:
			var target_velocity: float = direction * speed
			velocity.x = lerp(velocity.x, target_velocity, control)
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()
	
	$CameraController.position.y = clamp($CameraController.position.y, 0, 1000000)
	$CameraController.position = lerp($CameraController.position, position, 0.15)
	update_animation()
	update_facing_direction()

func update_animation() -> void:
	animation_tree.set("parameters/Move/blend_position", direction)

func update_facing_direction() -> void:
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true

func set_overlapped_item(item: ItemBase) -> void:
	overlapped_item = item

func on_item_collected() -> void:
	collected_items += 1
	update_inventory_label()

func update_inventory_label() -> void:
	item_counter_label.text = "%d/%d" % [collected_items, total_items]
