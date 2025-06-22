extends Node2D

@onready var you_win: CanvasLayer = $YouWin
@onready var timer: Timer = $Timer
@onready var timer_text: RichTextLabel = $"Timer Text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	you_win.visible = false
	timer.start(31)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text.text = str(int(timer.time_left))


func _on_adjust_wave_win() -> void:
	you_win.visible = true
