extends CharacterBody2D


#const SPEED = 120.0
const SPEED = 5.0
const MAX_SPEED = 135.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left", "right")
	if xdirection:
		#velocity.x = xdirection * SPEED
		velocity.x += xdirection * SPEED
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
		
	else:
		velocity.x = move_toward(velocity.x, 0, 1.2)

	var ydirection := Input.get_axis("up", "down")
	if ydirection:
		#velocity.y = ydirection * SPEED
		velocity.y += ydirection * SPEED
		velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, 1.2)

	move_and_slide()
