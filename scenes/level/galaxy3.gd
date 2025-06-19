extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.s
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		#get_tree().change_scene_to_file("res://scenes/level/level3.tscn")
		var level3 = preload("res://scenes/level/level3.tscn").instantiate()

		# Add level3 to the root of the scene tree
		get_tree().root.add_child(level3)

		# Disable the camera from main scene
		get_tree().current_scene = self
		var scene1_camera = get_tree().current_scene.get_node("Player/Camera2D")
		scene1_camera.enabled = false
		
		get_tree().paused = true
		get_tree().current_scene = level3
