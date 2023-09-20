extends CharacterBody2D
var Damage = 10
var Health = 10
var Velocity = 0
var initial_speed = 30.0


func damage(d):
	Health -= d
	if Health <= 0:
		queue_free()


func _ready():
	velocity = Vector2(0,initial_speed*randf()).rotated(2*PI*randf())
	
func _physics_process(delta):
	position.x = wrapf(position.x,0,1152)
	position.y = wrapf(position.y,0,648)
	move_and_slide()
	
	


