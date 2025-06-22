extends Area2D

var has_player = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.s
func _process(delta: float) -> void:
	if has_player and Input.is_action_just_pressed("Interact"):
		call_deferred("_load_level3")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not has_player:
		has_player = true
		GlobalSignals.emit_signal("entered_galaxy_collision")

func pause_scene(scene_root: Node) -> void:
	for node in scene_root.get_children():
		if node is Node:
			node.process_mode = Node.PROCESS_MODE_DISABLED
			pause_scene(node)  # Recursively pause children
			
func _load_level3() -> void:
	has_player = false
	var level3 = preload("res://scenes/level/level3/level3.tscn").instantiate()
	# Add level3 to the root of the scene tree
	get_tree().root.add_child(level3)
	var scene1_camera = get_tree().current_scene.get_node("Player/Camera2D")
	scene1_camera.enabled = false

	# Pause everything (if needed)
	pause_scene(get_tree().current_scene)

	# Set current scene
	get_tree().current_scene = level3


func _on_body_exited(body):
	has_player = false
	GlobalSignals.emit_signal("exit_galaxy_collision")
