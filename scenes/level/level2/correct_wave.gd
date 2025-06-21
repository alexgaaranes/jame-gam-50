extends Line2D

@export var amplitude := 80.0          # Wave height
@export var speed := 4.0               # Scroll speed
@export var point_count := 80.0        # Resolution
@export var frequency := 5.0          # Number of full wave cycles

var phase := 0.0
	
func _process(delta):
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
