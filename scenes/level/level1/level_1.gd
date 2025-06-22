extends Node2D

@onready var player_level_1: CharacterBody2D = $Player_level1
@onready var trail: Line2D = $Trail
@onready var game_over: CanvasLayer = $GameOver
@onready var you_win: CanvasLayer = $YouWin
@onready var win_msg: CanvasLayer = $"Win Msg"
@onready var gameoveraudio: AudioStreamPlayer = $gameoveraudio


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_over.visible = false
	you_win.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	trail.add_point(player_level_1.global_position)


func _on_player_level_1_lose() -> void:
	player_level_1.velocity = Vector2.ZERO
	game_over.visible = true
	gameoveraudio.play()


func _on_player_level_1_win() -> void:
	player_level_1.velocity = Vector2.ZERO
	you_win.visible = true
	win_msg.visible = true
	GlobalSignals.emit_signal("completed_puzzle_1")
	GlobalSignals.add_solved()
	GlobalAudio.play_win_bgm()
