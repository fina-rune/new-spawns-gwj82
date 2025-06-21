extends Node3D

@onready var world_environment: WorldEnvironment = $WorldEnvironment
@onready var player: Player = $Player
@onready var npc: StaticBody3D = $NPC

var environment: Environment
var total_distance: float

func _ready() -> void:
	environment = world_environment.environment
	if environment:
		environment.adjustment_enabled = true
	total_distance = (npc.position - player.position).length()

func _physics_process(_delta: float) -> void:
	if environment:
		var player_position: Vector3 = player.position
		var npc_position: Vector3 = npc.position
		var distance_from_npc: float = (npc_position - player_position).length()
		var proximity_percent: float = 1.0 - (distance_from_npc / total_distance)
		environment.adjustment_saturation = clamp(proximity_percent, 0.0, 1.0)
