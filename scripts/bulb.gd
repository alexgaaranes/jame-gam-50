extends Node2D

var is_on = false

func _ready():
	GlobalSignals.emit_signal("turn_bulb_off", turn_off)
	GlobalSignals.emit_signal("turn_bulb_on", turn_on)

func _process(delta):
	pass

# Listeners
func turn_on():
	is_on = true

func turn_off():
	is_on = false
