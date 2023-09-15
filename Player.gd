extends CharacterBody2D

var speed = 5
var rotateSpeed = .03
var Health = 6
var max_speed = 450

var Bullet = load("res://Player/Bullet.tscn")
var nose = Vector2(-10,100)

func _ready():
	print(Health)
	


func get_input():
	var to_return = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("Move forward"):
		to_return += Vector2(0,1)
		$Exhaust.show()
	if Input.is_action_pressed("Rotate Left"):
		rotation -= rotateSpeed
	if Input.is_action_pressed("Rotate Right"):
		rotation += rotateSpeed
	return to_return.rotated(rotation)


func _physics_process(delta):
	velocity += get_input() * speed
	velocity += get_input()*speed
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	position.x = wrapf(position.x, 0.0, 1152.0)
	position.y = wrapf(position.y, 0.0, 648.0)	
	move_and_slide()


	if Input.is_action_just_pressed("Shoot"):
		print("Shoot triggered") #Check if recieving input
		var bullet = Bullet.instantiate()
		bullet.position = position + nose.rotated(rotation)
		bullet.rotation = rotation
		var Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			Effects.add_child(bullet)
			print("Bullet added") #Chek if bullet was added to Effects node
		else:
			print("Effects node doesn't exist") #Checks if effects node exist
		
	

	
