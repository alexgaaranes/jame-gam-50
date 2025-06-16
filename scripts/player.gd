extends RigidBody3D

func _process(delta):
	var forward = Input.get_action_strength("forward")
	if Input.get_action_strength("forward"):
		print("forward")
	if Input.is_action_pressed("ui_up"):
		print("up")
	var backward = Input.get_action_strength("backward")
	var direction = forward - backward
	if direction != 0:
		apply_central_force(Vector3.FORWARD * direction * 1200.0 * delta)
