extends Node2D

export (String, FILE, "*.tscn") var Next_Scene: String

onready var text := $Label

var time_start := 0.00
var countdowns := true

func _on_Button_pressed()->void:
	Event.emit_signal("ChangeScene", Next_Scene)

func _on_Button2_pressed() -> void:
	PlayerData.reset()

func _ready() -> void: 
	time_start = OS.get_ticks_msec()
	PlayerData.connect("game_reset", self, "reset") 

func reset() -> void:
	$Label.visible = false
	countdowns = true
	time_start = OS.get_ticks_msec()

func _process(delta: float) -> void:
	var time_passed = OS.get_ticks_msec()
	if time_passed - time_start > 3000 and countdowns and !PlayerData.reset_enable:
		$AudioStreamPlayer.play()
		PlayerData.game_start = true
		$Label.visible = true
		countdowns = false


