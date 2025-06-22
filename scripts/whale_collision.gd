extends Area2D

var has_player = false

func _on_body_entered(body: Node2D) -> void:
	# call global signal for dialogue
	if body.name == "Player":
		GlobalSignals.emit_signal("entered_whale_collision")
		has_player = true
	
func _process(delta):
	if has_player and Input.is_action_just_pressed("Interact"):
		GlobalSignals.emit_signal("interacted_whale")
		GlobalAudio.play_listen_whale()
		has_player = false

func _on_body_exited(body: Node2D) -> void:
	# call global signal for exit
	if body.name == "Player":
		GlobalSignals.emit_signal("exit_whale_collision")
		has_player = false
