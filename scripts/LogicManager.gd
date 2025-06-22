extends Node
@onready var you_win: CanvasLayer = $YouWin
@onready var timer: Timer = $Timer
@onready var timer_text: RichTextLabel = $"Timer Text"
@onready var game_over: CanvasLayer = $GameOver
@onready var win_msg: CanvasLayer = $"Win Msg"
@onready var gameoveraudio: AudioStreamPlayer = $gameoveraudio

var has_won = false

func _ready():
	# setup lahat ng connections haha
	$Lever.connect("state_changed", Callable($AndGate, "set_input").bind(0))
	$Lever5.connect("state_changed", Callable($NotGate, "set_input").bind(0))
	$NotGate.connect("output_changed", Callable($AndGate, "set_input").bind(1))
	$NotGate.connect("output_changed", Callable($OrGate, "set_input").bind(0))
	$Lever4.connect("state_changed", Callable($OrGate, "set_input").bind(1))
	$Lever4.connect("state_changed", Callable($OrGate2, "set_input").bind(0))
	$Lever3.connect("state_changed", Callable($OrGate2, "set_input").bind(1))
	$OrGate2.connect("output_changed", Callable($NotGate3, "set_input").bind(0))
	$OrGate.connect("output_changed", Callable($OrGate3, "set_input").bind(0))
	$NotGate3.connect("output_changed", Callable($OrGate3, "set_input").bind(1))
	$AndGate.connect("output_changed", Callable($AndGate2, "set_input").bind(0))
	$OrGate.connect("output_changed", Callable($AndGate2, "set_input").bind(1))
	$AndGate2.connect("output_changed", Callable($OrGate7, "set_input").bind(0))
	$OrGate3.connect("output_changed", Callable($OrGate7, "set_input").bind(1))
	$OrGate7.connect("output_changed", Callable($NotGate8, "set_input").bind(0))
	$NotGate8.connect("output_changed", Callable($OrGate8, "set_input").bind(0))
	$Lever6.connect("state_changed", Callable($AndGate3, "set_input").bind(0))
	$Lever7.connect("state_changed", Callable($AndGate3, "set_input").bind(1))
	$Lever7.connect("state_changed", Callable($AndGate4, "set_input").bind(0))
	$Lever8.connect("state_changed", Callable($AndGate4, "set_input").bind(1))
	$Lever8.connect("state_changed", Callable($OrGate4, "set_input").bind(0))
	$Lever9.connect("state_changed", Callable($OrGate4, "set_input").bind(1))
	$Lever2.connect("state_changed", Callable($AndGate5, "set_input").bind(1))
	$NotGate3.connect("output_changed", Callable($AndGate5, "set_input").bind(0))
	$AndGate4.connect("output_changed", Callable($NotGate4, "set_input").bind(0))
	$NotGate4.connect("output_changed", Callable($OrGate5, "set_input").bind(0))
	$OrGate4.connect("output_changed", Callable($OrGate5, "set_input").bind(1))
	$AndGate3.connect("output_changed", Callable($OrGate6, "set_input").bind(0))
	$NotGate4.connect("output_changed", Callable($OrGate6, "set_input").bind(1))
	$OrGate6.connect("output_changed", Callable($AndGate8, "set_input").bind(0))
	$OrGate5.connect("output_changed", Callable($AndGate8, "set_input").bind(1))
	$AndGate8.connect("output_changed", Callable($AndGate9, "set_input").bind(1))
	$AndGate5.connect("output_changed", Callable($NotGate9, "set_input").bind(0))
	$OrGate6.connect("output_changed", Callable($AndGate9, "set_input").bind(0))
	$AndGate9.connect("output_changed", Callable($NotGate7, "set_input").bind(0))
	$NotGate7.connect("output_changed", Callable($NotGate6, "set_input").bind(0))
	$OrGate3.connect("output_changed", Callable($OrGate10, "set_input").bind(0))
	$NotGate9.connect("output_changed", Callable($OrGate10, "set_input").bind(1))
	$NotGate8.connect("output_changed", Callable($AndGate11, "set_input").bind(0))
	$OrGate10.connect("output_changed", Callable($AndGate11, "set_input").bind(1))
	$AndGate11.connect("output_changed", Callable($OrGate8, "set_input").bind(1))
	$OrGate10.connect("output_changed", Callable($OrGate9, "set_input").bind(0))
	$NotGate7.connect("output_changed", Callable($OrGate9, "set_input").bind(1))
	$AndGate11.connect("output_changed", Callable($NotGate10, "set_input").bind(0))
	$OrGate9.connect("output_changed", Callable($AndGate10, "set_input").bind(1))
	$NotGate10.connect("output_changed", Callable($AndGate10, "set_input").bind(0))
	$AndGate10.connect("output_changed", Callable($OrGate11, "set_input").bind(0))
	$NotGate7.connect("output_changed", Callable($OrGate11, "set_input").bind(1))
	$AndGate8.connect("output_changed", Callable($OrGate11, "set_input").bind(0))

	# Connect to bulb
	$OrGate8.connect("output_changed", Callable($Bulb, "set_state"))
	$OrGate11.connect("output_changed", Callable($Bulb3, "set_state"))
	$NotGate6.connect("output_changed", Callable($Bulb2, "set_state"))
	
	$Lever.emit_signal("state_changed", $Lever.is_on)
	$Lever2.emit_signal("state_changed", $Lever2.is_on)
	$Lever3.emit_signal("state_changed", $Lever3.is_on)
	$Lever4.emit_signal("state_changed", $Lever4.is_on)
	$Lever5.emit_signal("state_changed", $Lever5.is_on)
	$Lever6.emit_signal("state_changed", $Lever6.is_on)
	$Lever7.emit_signal("state_changed", $Lever7.is_on)
	$Lever8.emit_signal("state_changed", $Lever8.is_on)
	$Lever9.emit_signal("state_changed", $Lever9.is_on)
	you_win.visible = false
	
	timer.start(61)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text.text = str(int(timer.time_left))
	if timer.is_stopped():
		game_over.visible = true
		gameoveraudio.play()
	if $Bulb.is_on and $Bulb2.is_on and $Bulb3.is_on and not has_won:
		show_you_win()
		# Update some thing in the map
		
func show_you_win():
	has_won = true
	timer.paused = true
	you_win.visible = true
	win_msg.visible = true
	GlobalSignals.emit_signal("completed_puzzle_3")
	GlobalSignals.add_solved()
	GlobalAudio.play_win_bgm()
