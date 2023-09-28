extends CharacterBody2D
var Damage = 10
var size = 3
var Health = size * 5
var Velocity = 0
var initial_speed = 30.0



func damage(d):
	Health -= d
	if Health < 1:
		Global.update_score(100)
		print(Global.Score)
		queue_free()

	
	
func _ready():
	velocity = Vector2(0,initial_speed*randf()).rotated(2*PI*randf())
	
func _physics_process(delta):
	position.x = wrapf(position.x,0,Global.VP.x)
	position.y = wrapf(position.y,0,Global.VP.y)
	move_and_slide()
	
	


