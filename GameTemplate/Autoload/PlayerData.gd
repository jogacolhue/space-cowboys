extends Node

signal score_updated
signal player_wins
signal player_loses
signal game_start
signal game_reset

var score: = 0 setget set_score  
var game_start: = false setget set_game_start
var reset_enable := false  

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func player_wins() -> void:
	game_start = false
	reset_enable = true
	emit_signal("player_wins")
	
func player_loses() -> void:
	game_start = false
	reset_enable = true
	emit_signal("player_loses")
	  
func set_game_start(value: bool) -> void:
	game_start = value
	emit_signal("game_start")
	
func reset() -> void:
#	score = 0  
	game_start = false
	reset_enable = false
	emit_signal("game_reset")
