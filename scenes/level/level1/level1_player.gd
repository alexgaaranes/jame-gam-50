extends CharacterBody2D

const SPEED = 150.0

signal lose
signal win
var done = false

func _on_ready() -> void:
	velocity.x = SPEED

func _physics_process(delta: float) -> void:
	if done:
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection := Input.get_axis("left", "right")
	if xdirection:
		if xdirection * velocity.x >= 0:
			velocity.x = xdirection * SPEED
			velocity.y = 0

	var ydirection := Input.get_axis("up", "down")
	if ydirection:
		if ydirection * velocity.y >= 0:
			velocity.y = ydirection * SPEED
			velocity.x = 0

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	done = true
	if area.is_in_group("goal"):
		emit_signal("win")
	else:
		emit_signal("lose")


func _on_button_pressed() -> void:
	done = true
