extends CharacterBody2D
var damage = 2
var Health = 3
var Velocity = 0
var initial_speed = 30.0

func _ready():
	velocity = Vector2(0,initial_speed*randf()).rotated(2*PI*randf())
	
func _physics_process(delta):
	position.x = wrapf(position.x,0,1152)
	position.y = wrapf(position.y,0,648)
	move_and_slide()
	
	



