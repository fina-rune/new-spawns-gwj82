class_name Player

extends CharacterBody3D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var player_sprite: Sprite3D = $Sprite3D
@onready var state_machine: StateMachine = $StateMachine


@export var speed: float = 5.0
@export var air_control: float = 0.3

var direction: float

func _ready() -> void:
	animation_tree.active = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		#jump()
		pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	direction = Input.get_axis("move_left", "move_right")	
	
	var control: float = 1.0 if is_on_floor() else air_control
	if direction and state_machine.can_player_move():
		var target_velocity: float = direction * speed
		velocity.x = lerp(velocity.x, target_velocity, control)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation() -> void:
	animation_tree.set("parameters/Move/blend_position", direction)

func update_facing_direction() -> void:
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
