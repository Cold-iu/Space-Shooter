extends Node2D

var Player = load("res://Player/Player.tscn")
var lives = 3
func _physics_process(_delta):
	if lives > 1:
		if get_child_count() == 0:
			var player = Player.instantiate()
			player.position = Vector2(512,300)
			add_child(player)
			lives -= 1
			print("Lives:",lives )
