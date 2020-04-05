extends Node2D

onready var sprite:= $AnimatedSprite

var time := 0.00
var time_limit := 0.00

func _ready() -> void:
	PlayerData.connect("player_wins", self, "lose") 
	PlayerData.connect("game_start", self, "countdown") 
	PlayerData.connect("game_reset", self, "reset") 
	
func lose() -> void: 
	time = 0.00
	time_limit = 0.00
	sprite.play("dead")

func countdown() -> void:
	time = OS.get_ticks_msec()
	time_limit = rand_range(260, 300)

func reset() -> void:
	sprite.play("default")
	
func _process(delta: float) -> void:
	if time > 0:
		if OS.get_ticks_msec() - time > time_limit:
			sprite.play("shoot")
			time = 0
			PlayerData.player_loses()
