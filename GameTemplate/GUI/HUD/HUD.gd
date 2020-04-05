extends CanvasLayer

onready var score:= $Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()


func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score 

