extends Sprite2D

func _process(delta):
	if GlobalSignals.number_of_solved >= 3:
		visible = true
