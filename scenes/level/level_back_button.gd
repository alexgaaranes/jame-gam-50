extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var main_scene = get_tree().root.get_node("Main")
	
	get_tree().paused = false
	
	var main_scene_camera = get_tree().root.get_node("Main/Player/Camera2D")
	main_scene_camera.enabled = true
	
	get_tree().current_scene.queue_free()
	
	get_tree().current_scene = main_scene
