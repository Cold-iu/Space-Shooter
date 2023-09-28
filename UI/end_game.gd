extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Thanks for playing! Your final score was " + str(Global.Score) + "." # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_again_button_pressed():
	Global.reset()
	get_tree().change_scene_to_file("res://UI/Main_Menu.tscn") # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit() # Replace with function body.
