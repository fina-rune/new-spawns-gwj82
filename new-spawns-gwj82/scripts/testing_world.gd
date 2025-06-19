extends Node3D

@onready var world_environment: WorldEnvironment = $WorldEnvironment
@onready var player: Player = $Player
@onready var start: Billboard = $Start
@onready var end: Billboard = $End

var environment: Environment
var total_distance: float

func _ready() -> void:
	environment = world_environment.environment
	total_distance = (end.global_position - start.global_position).length()
	
func _physics_process(delta: float) -> void:
	var player_position: Vector3 = player.global_position
	var distance_from_start: float = ((start.global_position - player_position).length()) / total_distance
	environment.adjustment_saturation = distance_from_start 
