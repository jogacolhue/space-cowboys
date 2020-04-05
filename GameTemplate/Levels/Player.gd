extends Node2D

onready var sprite:= $AnimatedSprite
 
func _ready() -> void:
	PlayerData.connect("player_loses", self, "lose") 
	PlayerData.connect("game_reset", self, "reset") 
	
func lose() -> void:
	PlayerData.score -= 1
	sprite.play("dead")

func reset() -> void:
	sprite.play("default")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump") and !PlayerData.reset_enable: 
		if !PlayerData.game_start:
			PlayerData.player_loses()
			return
		else:
			PlayerData.score += 1
			PlayerData.player_wins()
			sprite.play("shoot")
			return
	
#	if event.is_action_pressed("Jump") and PlayerData.reset_enable:
#		PlayerData.reset()
#		return
