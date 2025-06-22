extends Node2D

var inputs = [false, false]
var output = false

signal output_changed(bool)

func set_input(value, index):
	inputs[index] = value
	evaluate()

func evaluate():
	output = inputs[0] or inputs[1]
	emit_signal("output_changed", output)
