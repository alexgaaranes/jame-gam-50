extends Area2D

@export var speed := 200.0

func _process(delta: float) -> void:
	var direction := Vector2.ZERO

	if Input.is_action_pressed("strafe_right"):
		direction.x += 1
	if Input.is_action_pressed("strafe_left"):
		direction.x -= 1
	if Input.is_action_pressed("backward"):
		direction.y += 1
	if Input.is_action_pressed("forward"):
		direction.y -= 1

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		position += direction * speed * delta
