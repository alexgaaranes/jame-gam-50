extends Node2D

var is_on := false

func set_state(state: bool) -> void:
	is_on = state
	update_visual()

func update_visual():
	$on_head.visible = is_on
	$off_head.visible = not is_on
