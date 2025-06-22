extends Control

var on_start = true
var dialogue = 0

func _ready():
	GlobalSignals.connect("entered_whale_collision", show_whale_interact_text)
	GlobalSignals.connect("exit_whale_collision", hide_whale_interact_text)
	GlobalSignals.connect("entered_galaxy_collision", show_galaxy_interact_text)
	GlobalSignals.connect("exit_galaxy_collision", hide_galaxy_interact_text)
	GlobalSignals.connect("interacted_whale", show_whale_dialogue)

func _process(delta):
	if on_start and Input.is_action_just_pressed("Interact"):
		$ColorRect.visible = false
		$RichTextLabel.visible = false
		$Label.visible = false
		on_start = false

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
			$Whale_Dialogue.text = "ꋫꁒ☬ꅐꋫyꉣꃃ ꉣꃃeꉣꃃrꋫꁒꉣꃃeꉣꁒꉣ☬ꅐ"
		2:
			$Whale_Dialogue.text = "ꉣa☬ yꁒu ☆eꋫr ꅐe?"
		3:
			$Whale_Dialogue.text = "Can you hear me?"
		_:
			$Whale_Dialogue.text = "ꋫꁒꉣ☬ꅐꋫꃃ•☆☬ꋫꁒꉣꋫꐟꃃ•ꅐꋫꁒꉣ☬ꅐꋫ"
	
	# Start the dialogue for ending making use of timer
	


func _on_dialogue_timer_timeout():
	$Dialogue_Timer.stop()
	match dialogue:
		0:
			$Whale_Dialogue.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue2.visible = true
		1:
			$Whale_Dialogue2.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue3.visible = true
		2:
			$Whale_Dialogue3.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue4.visible = true
		3:
			$Whale_Dialogue4.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue5.visible = true
		4:
			$Whale_Dialogue5.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue6.visible = true
		5:
			$Whale_Dialogue6.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue7.visible = true
		6:
			$Whale_Dialogue7.visible = false
			dialogue += 1
			$Dialogue_Timer.start()
			$Whale_Dialogue8.visible = true
		7:
			$Whale_Dialogue8.visible = false
