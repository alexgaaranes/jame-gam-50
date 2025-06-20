extends Area2D

var has_player = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_player and Input.is_action_just_pressed("Interact"):
		switch_scene()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GlobalSignals.emit_signal("entered_galaxy_collision")
		has_player = true

func switch_scene():
	has_player = false
	var level1 = preload("res://scenes/level/level1.tscn").instantiate()

	# Add level1 to the root of the scene tree
	get_tree().root.add_child(level1)

	# Disable the camera from main scene
	get_tree().current_scene = self
	var scene1_camera = get_tree().current_scene.get_node("Player/Camera2D")
	scene1_camera.enabled = false
	
	get_tree().paused = true
	get_tree().current_scene = level1

func _on_body_exited(body):
	has_player = false
	GlobalSignals.emit_signal("exit_galaxy_collision")
