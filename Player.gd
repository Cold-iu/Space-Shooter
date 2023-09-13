extends CharacterBody2D

var speed = 400
var rotateSpeed = .05
func _physics_process(delta):
	if Input.is_action_pressed("Rotate Left"):
		rotation -= rotateSpeed
	if Input.is_action_pressed("Rotate Right"):
		rotation += rotateSpeed
	if Input.is_action_pressed("Move forward"):
		velocity = velocity + Vector2(0,speed).rotated(rotation)
	pass
	
	position.x = wrapf(position.x,0,1152)
	position.y = wrapf(position.y,0,648)
	velocity = velocity.normalized() * clamp(velocity.length(),0,speed)
	move_and_slide()
