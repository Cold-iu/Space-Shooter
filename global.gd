extends Node

var VP = Vector2.ZERO

var Score = 0
var time = 0
var lives = 0

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().size_changed.connect(_resize)
	reset()

func _resize():
	VP = get_viewport().size

func reset():
	get_tree().paused = false
	Score = 0
	time = 30
	lives = 3


func update_score(s):
	Score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()

func update_lives(l):
	lives += l
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()
		if lives < 1:
			get_tree().change_scene_to_file("res://UI/End_Game.tscn")
	
func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		var Menu = get_node_or_null("/root/Game/UI/Menu")
		if Menu == null:
			get_tree().quit()
		else:
			if Menu.visible:
				get_tree().paused = false
				Menu.hide()
			else:
				get_tree().paused = true
				Menu.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Exit"):
		get_tree().quit()


func _physics_process(_delta):
	var Asteroid_Container = get_node_or_null("/root/Game/Asteroid_Container")
	var Enemy_Container = get_node_or_null("/root/Game/Enemy_Container")
	if Asteroid_Container != null and Enemy_Container != null:
		if Asteroid_Container.get_child_count() == 0 and Enemy_Container.get_child_count() == 0:
			update_score(Global.time * 10)
			get_tree().change_scene_to_file("res://UI/End_Game.tscn")
