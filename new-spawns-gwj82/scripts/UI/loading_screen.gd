extends CanvasLayer

@export var scene_name: String

var progress: Array = []
var scene_load_status: int = 0

func _ready() -> void:
	scene_name = "res://scenes/Levels/level_1.tscn"
	ResourceLoader.load_threaded_request(scene_name)


func _process(_delta: float) -> void:
	scene_load_status = ResourceLoader.load_threaded_get_status(scene_name, progress)
	%LoadingPercentText.text = str(floor(progress[0] * 100)) + "%"
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		set_process(false)
		await get_tree().create_timer(1).timeout
		var new_scene: Resource = ResourceLoader.load_threaded_get(scene_name)
		get_tree().change_scene_to_packed(new_scene)
