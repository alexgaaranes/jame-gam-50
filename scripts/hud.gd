extends Control

func _ready():
	GlobalSignals.connect("entered_whale_collision", show_whale_interact_text)
	GlobalSignals.connect("exit_whale_collision", hide_whale_interact_text)
	GlobalSignals.connect("entered_galaxy_collision", show_galaxy_interact_text)
	GlobalSignals.connect("exit_galaxy_collision", hide_galaxy_interact_text)
	GlobalSignals.connect("interacted_whale", show_whale_dialogue)

func show_whale_interact_text():
	$Whale_Interact_Text.visible = true

func show_galaxy_interact_text():
	$Galaxy_Interact_Text.visible = true

func hide_whale_interact_text():
	$Whale_Interact_Text.visible = false

func hide_galaxy_interact_text():
	$Galaxy_Interact_Text.visible = false

func show_whale_dialogue():
	hide_whale_interact_text()
	$Dialogue_Timer.start()
	$Whale_Dialogue.visible = true
	match GlobalSignals.number_of_solved:
		1:
			$Whale_Dialogue.text = "ロロロロyロロ ロeロrロロeロ"
		2:
			$Whale_Dialogue.text = "ロaロ yロu ロeロr ロe?"
		3:
			$Whale_Dialogue.text = "Can you hear me?"
		_:
			$Whale_Dialogue.text = "ロロロロロロロロロロロロロロロ"


func _on_dialogue_timer_timeout():
	$Dialogue_Timer.stop()
	$Whale_Dialogue.visible = false
