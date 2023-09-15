extends Node

var Score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	print(Score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Exit"):
		get_tree().quit()
	
	
