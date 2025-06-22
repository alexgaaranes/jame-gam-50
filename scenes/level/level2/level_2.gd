extends Node2D

@onready var you_win: CanvasLayer = $YouWin
@onready var timer: Timer = $Timer
@onready var timer_text: RichTextLabel = $"Timer Text"
@onready var game_over: CanvasLayer = $GameOver
var win = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	you_win.visible = false
	game_over.visible = false
	timer.start(61)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text.text = str(int(timer.time_left))
	if timer.is_stopped() && !win:
		times_up()
	
func times_up() -> void:
	game_over.visible = true

func _on_adjust_wave_win() -> void:
	win = true
	timer.paused = true
	you_win.visible = true
