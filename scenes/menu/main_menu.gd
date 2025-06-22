extends Node2D

@onready var ui_click: AudioStreamPlayer = $"ui click"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	ui_click.play()
	await get_tree().create_timer(0.4).timeout
	get_tree().change_scene_to_file("res://scenes/level/game.tscn")

func _on_about_us_pressed() -> void:
	ui_click.play()
	await get_tree().create_timer(0.4).timeout
	get_tree().change_scene_to_file("res://scenes/menu/about_us.tscn")
