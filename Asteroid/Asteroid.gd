extends CharacterBody2D
var Damage = 10
var size = randi_range(0,2)
var Health = size * 5
var Velocity = 0
var initial_speed = 30.0

var Asteroid = load("res://Asteroid/asteroid.tscn")

func damage(d):
	Health -= d
	if Health < 1 and size >1:
		Global.update_score(100)
		for i in range(size-1):
			var split = Asteroid.instantiate()
			get_parent().add_child(split)
			split.scale = Vector2(1,1)
			split.size = size - 1
			split.position = position
			split.Health = split.size * 5
	elif Health < 1 and size <= 1:
		Global.update_score(200)
		print(Global.Score)
		queue_free()

func _ready():
	velocity = Vector2(0,initial_speed*randf()).rotated(2*PI*randf())
	
func _physics_process(delta):
	position.x = wrapf(position.x,0,Global.VP.x)
	position.y = wrapf(position.y,0,Global.VP.y)
	move_and_slide()
	
	


