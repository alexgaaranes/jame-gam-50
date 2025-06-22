extends Node

var number_of_solved = 0

signal entered_whale_collision
signal exit_whale_collision
signal entered_galaxy_collision
signal exit_galaxy_collision

signal final_interaction_whale

signal completed_puzzle_1
signal completed_puzzle_2
signal completed_puzzle_3

signal interacted_whale

func add_solved():
	number_of_solved += 1
