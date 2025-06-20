extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.s
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		call_deferred("_load_level3")

func _load_level3() -> void:
	var level3 = preload("res://scenes/level/level3/level3.tscn").instantiate()

	# Add level3 to the root of the scene tree
	get_tree().root.add_child(level3)

	# Disable the camera from main scene
	var scene1_camera = get_tree().current_scene.get_node("Player/Camera2D")
	scene1_camera.enabled = false

	# Pause everything (if needed)
	get_tree().paused = true

	# Set current scene
	get_tree().current_scene = level3
