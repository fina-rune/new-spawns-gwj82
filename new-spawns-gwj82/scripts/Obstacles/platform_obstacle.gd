class_name PlatformBase
extends ObstacleBase

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func trigger() -> void:
	animation_player.play("platform_movement")
