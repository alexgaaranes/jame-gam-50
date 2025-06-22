extends CanvasLayer

signal back_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func resume_scene(scene_root: Node) -> void:
	for node in scene_root.get_children():
		if node is Node:
			node.process_mode = Node.PROCESS_MODE_ALWAYS
			resume_scene(node)

func _on_texture_button_pressed() -> void:
	emit_signal("back_pressed")
	var main_scene = get_tree().root.get_node("Main")
	for node in get_tree().get_nodes_in_group("ui"):
		node.visible = false
	
	resume_scene(main_scene)
	
	get_tree().current_scene.visible = false
	var main_scene_camera = get_tree().root.get_node("Main/Player/Camera2D")
	main_scene_camera.enabled = true
	
	get_tree().current_scene.queue_free()
	
	get_tree().current_scene = main_scene
