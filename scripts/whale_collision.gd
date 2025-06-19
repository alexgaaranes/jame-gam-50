extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# call global signal for dialogue
	if body.name == "Player":
		GlobalSignals.emit_signal("entered_whale_collision")
	pass

func _on_body_exited(body: Node2D) -> void:
	# call global signal for exit
	if body.name == "Player":
		GlobalSignals.emit_signal("exit_whale_collision")
	pass
