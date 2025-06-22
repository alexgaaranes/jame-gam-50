extends Node

@onready var space_ambient = preload("res://assets/audio/space ambiance.mp3")
@onready var listen_whale = preload("res://assets/audio/whale sound.mp3")
@onready var win_bgm = preload("res://assets/audio/win.mp3")

var audio_player = null
var endscreen_player = null

func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

func play_space_ambient():
	var bgm_player = AudioStreamPlayer.new()
	bgm_player.stream = space_ambient
	add_child(bgm_player)
	bgm_player.play()
	await bgm_player.finished
	bgm_player.queue_free()

func play_listen_whale():
	audio_player.stream = listen_whale
	audio_player.play()
	await audio_player.finished

func play_win_bgm():
	audio_player.stream = win_bgm
	audio_player.play()
	await audio_player.finished
