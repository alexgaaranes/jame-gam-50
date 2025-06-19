extends Sprite2D

const Y_OFFSET = 25
var is_going_up: bool
var ORG_POS

func _ready() -> void:
	ORG_POS = position
	is_going_up = true

func _process(delta):
	if position.y >= ORG_POS.y - Y_OFFSET and is_going_up:
		position.y -= delta * 10
	else:
		is_going_up = false
	if position.y <= ORG_POS.y and not is_going_up:
		position.y += delta * 10
	else:
		is_going_up = true
