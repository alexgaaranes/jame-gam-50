extends Line2D

@export var amplitude := 80.0          # Wave height
@export var speed := 4.0               # Speed
@export var point_count := 80.0         # Resolution
@export var frequency := 5.0          # Number of full wave cycles
var phase := 0.0

var margin_error = 0.015

var correct_freq_knob_value = randf_range(0.1, 0.9)
var correct_amp_knob_value = randf_range(0.1, 0.9)
var correct_speed_knob_value = randf_range(0.1, 0.9)

var adjust_freq_knob_value = 0.0
var adjust_amp_knob_value = 0.0
var adjust_speed_knob_value = 0.0

var freq_dragging = false
var amp_dragging = false
var speed_dragging = false

var updated = false


signal win 

func _ready() -> void:
	frequency = abs(0 - correct_freq_knob_value) * 60 + 5
	amplitude = - abs(0 - correct_speed_knob_value) * 150 + 80
	speed = abs(0 - correct_speed_knob_value) * 70 + 4
	
func _process(delta):
	handle_input(delta)
	phase += delta * speed

	var width = 400
	var height = 200
	var points = []

	for i in range(point_count):
		var t = float(i) / (point_count - 1)  # from 0 to 1
		var x = t * width
		var y = sin(t * TAU * frequency + phase) * amplitude
		points.append(Vector2(x, y + height / 2))  # center vertically

	self.points = points
	if updated && !freq_dragging && !speed_dragging && !amp_dragging:
		_print_knob_values()
		_check_win()
		updated = false
		
func handle_input(delta):
	if Input.is_action_pressed("ui_right"):
		frequency += delta * 2.0
	elif Input.is_action_pressed("ui_left"):
		frequency -= delta * 2.0

	frequency = clamp(frequency, 0.1, 50.0)  # Limit values

func _print_knob_values():
	print("freq knob value: ", adjust_freq_knob_value)
	print("correct freq knob value: ", correct_freq_knob_value)
	print()
	print("speed knob value: ", adjust_speed_knob_value)
	print("correct speed knob value: ", correct_speed_knob_value)
	print()
	print("amp knob value: ", adjust_amp_knob_value)
	print("correct amp knob value: ", correct_amp_knob_value)
	print()
	
func _on_freq_knob_dial_rotated(degrees: float, value: float) -> void:
	frequency = abs(value - correct_freq_knob_value) * 60 + 5
	adjust_freq_knob_value = value
	freq_dragging = true
	updated = true	

func _on_speed_knob_dial_rotated(degrees: float, value: float) -> void:
	speed = abs(value - correct_speed_knob_value) * 70 + 4
	adjust_speed_knob_value = value
	speed_dragging = true
	updated = true

func _on_amp_knob_dial_rotated(degrees: float, value: float) -> void:
	amplitude = - abs(value - correct_amp_knob_value) * 150 + 80
	adjust_amp_knob_value = value
	amp_dragging = true
	updated = true

func _check_win():
	if abs(adjust_freq_knob_value - correct_freq_knob_value) <= margin_error && abs(adjust_amp_knob_value - correct_amp_knob_value) <= margin_error && abs(adjust_speed_knob_value - correct_speed_knob_value) <= margin_error:
		print("WINNER BETCH")
		speed = 4.0
		amplitude = 80.0
		frequency = 5.0
		emit_signal("win")

func _on_freq_knob_dragging(isDragging: bool) -> void:
	freq_dragging = isDragging


func _on_speed_knob_dragging(isDragging: bool) -> void:
	speed_dragging = isDragging


func _on_amp_knob_dragging(isDragging: bool) -> void:
	amp_dragging = isDragging
