extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		call_deferred("_load_level1")

func pause_scene(scene_root: Node) -> void:
	for node in scene_root.get_children():
		if node is Node:
			node.process_mode = Node.PROCESS_MODE_DISABLED
			pause_scene(node)  # Recursively pause children
			
func _load_level1() -> void:
	var level1 = preload("res://scenes/level/level1/level1.tscn").instantiate()
		
	# Add level1 to the root of the scene tree
	get_tree().root.add_child(level1)

	# Disable the camera from main scene
	var scene1_camera = get_tree().current_scene.get_node("Player/Camera2D")
	scene1_camera.enabled = false

	# Pause everything (if needed)
	pause_scene(get_tree().current_scene)

	# Set current scene
	get_tree().current_scene = level1
