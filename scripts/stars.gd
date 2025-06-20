extends Sprite2D

const SCALE_OFFSET = 0.25
var ORG_SCALE
var is_shrink

func _ready() -> void:
	ORG_SCALE = scale
	is_shrink = true

func _process(delta: float) -> void:
	if scale.x <= ORG_SCALE.x + SCALE_OFFSET and is_shrink:
		scale.x += delta * 0.05
		scale.y += delta * 0.05
	else:
		is_shrink = false
	
	if scale.x >= ORG_SCALE.x and not is_shrink:
		scale.x -= delta * 0.05
		scale.y -= delta * 0.05
	else:
		is_shrink = true
	
