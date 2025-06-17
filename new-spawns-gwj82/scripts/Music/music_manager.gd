extends Node

var music_player: AudioStreamPlayer = null
var current_stream: AudioStream = null

func _ready() -> void:
	music_player = AudioStreamPlayer.new()
	music_player.bus = "Music"
	music_player.autoplay = false
	add_child(music_player)

func play_music(stream: AudioStream) -> void:
	if stream != current_stream:
		current_stream = stream
		music_player.stream = stream
		music_player.play()
