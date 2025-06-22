extends Node2D

var puz1_done = false
var puz2_done = false
var puz3_done = false
var game_win = false

func _ready():
	GlobalSignals.connect("completed_puzzle_1", finish_puz1)
	GlobalSignals.connect("completed_puzzle_2", finish_puz2)
	GlobalSignals.connect("completed_puzzle_3", finish_puz3)
	
func _process(delta):
	if puz1_done and puz2_done and puz3_done and not game_win:
		game_win = true
		# overall win logic

# puzzle complete toggle
func finish_puz1():
	puz1_done = true

func finish_puz2():
	puz2_done = true

func finish_puz3():
	puz3_done = true
