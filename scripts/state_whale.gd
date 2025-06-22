extends Node2D

var has_changed_state = false

func _ready():
	pass
	
func _process(delta):
	if GlobalSignals.number_of_solved >= 3 and not has_changed_state:
		has_changed_state = true
		# change whale state
		$Body.visible = false
		$Improved_Body.visible = true
