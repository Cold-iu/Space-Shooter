extends CharacterBody2D

var speed = 5
var rotateSpeed = .03
var Health = 10
var max_speed = 450
var Damage = 10

var Bullet = load("res://Player/Bullet.tscn")
var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null
var nose = Vector2(-10,100)

func _ready():
	print(Health)
	
func damage(d):
	Health -= d
	if Health <= 0:
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instantiate()
			Effects.add_child(explosion)
			explosion.global_position = global_position
			hide() 
			await explosion.animation_finished
		queue_free()
		Global.update_lives(-1)
		Global.update_score(-50)

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
	position.x = wrapf(position.x, 0.0, Global.VP.x)
	position.y = wrapf(position.y, 0.0, Global.VP.y)	
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
		
	

	


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name != "Player":
		damage(body.Damage)
		body.damage(Damage)
		print("Its a hit!")
