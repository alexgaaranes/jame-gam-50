extends Node2D

var is_on := false

func _ready():
	$Area2D.connect("input_event", _on_input_event)
	update_visual()
	
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		toggle()

func toggle():
	is_on = !is_on
	update_visual()

func update_visual():
	$on_base.visible = is_on
	$on_stick.visible = is_on
	$on_gap.visible = is_on
	$off_base.visible = !is_on
	$off_stick.visible = !is_on
	$off_gap.visible = !is_on
