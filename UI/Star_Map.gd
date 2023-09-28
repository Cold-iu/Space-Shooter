extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_andromeda_pressed():
		get_tree().change_scene_to_file("res://Assets/game.tscn")



func _on_titan_pressed():
	get_tree().change_scene_to_file("res://Levels/Titan.tscn") # Replace with function body.


func _on_k_2_pressed():
	get_tree().change_scene_to_file("res://Levels/K2.tscn") # Replace with function body.


func _on_aos_pressed():
	get_tree().change_scene_to_file("res://Levels/Aos.tscn") # Replace with function body.


func _on_primaiv_pressed():
	get_tree().change_scene_to_file("res://Levels/Primaiv.tscn") # Replace with function body.


func _on_alpha_centauri_pressed():
	get_tree().change_scene_to_file("res://Levels/AlphaCentauri.tscn") # Replace with function body.
