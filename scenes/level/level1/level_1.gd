extends Node2D

@onready var player_level_1: CharacterBody2D = $Player_level1
@onready var trail: Line2D = $Trail
@onready var game_over: Node2D = $GameOver
@onready var you_win: Node2D = $YouWin

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


func _on_player_level_1_win() -> void:
	player_level_1.velocity = Vector2.ZERO
	you_win.visible = true
