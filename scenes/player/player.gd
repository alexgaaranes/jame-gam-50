extends CharacterBody2D

const SPEED = 5.0
const MAX_SPEED = 135.0

var last_anim = "f"      # Last direction string
var last_flip = false    # Last flip state

func _physics_process(delta: float) -> void:
	var xdirection := Input.get_axis("left", "right")
	var ydirection := Input.get_axis("up", "down")

	var direction = ""
	var flip = false

	# Apply movement
	if xdirection:
		velocity.x += xdirection * SPEED
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, 1.2)

	if ydirection:
		velocity.y += ydirection * SPEED
		velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, 1.2)

	# Determine direction
	if ydirection < 0:
		if xdirection != 0:
			direction = "sb"
			flip = xdirection < 0
		else:
			direction = "b"
	elif ydirection > 0:
		if xdirection != 0:
			direction = "sf"
			flip = xdirection < 0
		else:
			direction = "f"
	elif xdirection != 0:
		direction = "s"
		flip = xdirection < 0

	# Store last direction and flip
	if direction != "":
		last_anim = direction
		last_flip = flip
	else:
		direction = last_anim
		flip = last_flip

	# Idle vs Move
	var anim = ""
	if velocity.length() < 1.0:
		anim = direction + "_idle"
	else:
		anim = direction + "_move"

	# Play animation
	if $AnimatedSprite2D.animation != anim:
		$AnimatedSprite2D.play(anim)
	$AnimatedSprite2D.flip_h = flip

	move_and_slide()
