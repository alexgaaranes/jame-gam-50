extends Node2D

var puz1_done = false
var puz2_done = false
var puz3_done = false
var game_win = false

func _ready():
	GlobalSignals.connect("completed_puzzle_1", finish_puz1)
	GlobalSignals.connect("completed_puzzle_2", finish_puz2)
	GlobalSignals.connect("completed_puzzle_3", finish_puz3)
	GlobalAudio.play_space_ambient()
	
func _process(delta):
	if GlobalSignals.number_of_solved >= 3 and not game_win:
		game_win = true
		$Other_Whale1.visible = true
		$Other_Whale2.visible = true
		$Other_Whale3.visible = true
		$Other_Whale4.visible = true
		
		# Zoom out the camera
		$Player/Camera2D.zoom = Vector2(0.75, 0.75)
# puzzle complete toggle
func finish_puz1():
	puz1_done = true

func finish_puz2():
	puz2_done = true

func finish_puz3():
	puz3_done = true
