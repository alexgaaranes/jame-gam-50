extends Node

@onready var space_ambient = preload("res://assets/audio/space ambiance.mp3")
@onready var listen_whale = preload("res://assets/audio/whale sound.mp3")
@onready var win_bgm = preload("res://assets/audio/win.mp3")
@onready var menu_bgm = preload("res://assets/audio/main bg music.mp3")
@onready var rocket_loop = preload("res://assets/audio/rocket loop.mp3")

var audio_player = null
var bgm_player = null
var endscreen_player = null

func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

func play_space_ambient():
	if bgm_player == null:
		bgm_player = AudioStreamPlayer.new()
	bgm_player.stream = space_ambient
	add_child(bgm_player)
	bgm_player.play()
	await bgm_player.finished
	bgm_player.queue_free()
	


func play_menu_bgm():
	if bgm_player == null:
		bgm_player = AudioStreamPlayer.new()
	else:
		return
	bgm_player.stream = menu_bgm
	add_child(bgm_player)
	bgm_player.play()
	await bgm_player.finished
	bgm_player.queue_free()
	
func play_rocket():
	if not audio_player.is_playing() or audio_player.get_playback_position() > 0.7:
		audio_player.stream = rocket_loop
		audio_player.volume_db = -20
		audio_player.play()
		await audio_player.finished
		audio_player.volume_db = 0

func play_listen_whale():
	audio_player.stream = listen_whale
	audio_player.play()
	await audio_player.finished

func play_win_bgm():
	audio_player.stream = win_bgm
	audio_player.play()
	await audio_player.finished
