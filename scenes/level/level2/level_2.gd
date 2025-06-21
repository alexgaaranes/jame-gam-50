extends Node2D

@onready var you_win: CanvasLayer = $YouWin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	you_win.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_adjust_wave_win() -> void:
	you_win.visible = true
