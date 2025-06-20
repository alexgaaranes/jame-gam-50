extends Control

func _ready():
	GlobalSignals.connect("entered_whale_collision", show_whale_interact_text)
	GlobalSignals.connect("exit_whale_collision", hide_whale_interact_text)
	GlobalSignals.connect("entered_galaxy_collision", show_galaxy_interact_text)
	GlobalSignals.connect("exit_galaxy_collision", hide_galaxy_interact_text)

func show_whale_interact_text():
	$Whale_Interact_Text.visible = true

func show_galaxy_interact_text():
	$Galaxy_Interact_Text.visible = true

func hide_whale_interact_text():
	$Whale_Interact_Text.visible = false

func hide_galaxy_interact_text():
	$Galaxy_Interact_Text.visible = false
