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

func _on_button_pressed() -> void:
	emit_signal("back_pressed")
	var main_scene = get_tree().root.get_node("Main")
	for node in get_tree().get_nodes_in_group("ui"):
		node.visible = false
	
	resume_scene(main_scene)
	
	get_tree().current_scene.visible = false
	var main_scene_camera = get_tree().root.get_node("Main/Player/Camera2D")
	main_scene_camera.enabled = true
	
	var player = get_tree().root.get_node("Main/Player")
	player.set_deferred("collision_layer", 0)
	player.set_deferred("collision_mask", 0)
	await get_tree().create_timer(2.5).timeout
	get_tree().current_scene.queue_free()
	player.collision_layer = 1  
	player.collision_mask = 1   
	
	get_tree().current_scene = main_scene
