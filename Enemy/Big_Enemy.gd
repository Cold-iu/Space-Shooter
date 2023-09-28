extends CharacterBody2D

var Bullet = load("res://Enemy/Enemy_Bullet.tscn")
var Damage = 12
var Health = 25

var x_positions = [0,75,150,225,300,375,450,525,600]
var y_positions = [0,75,150,225,300]
var x_index = randi_range(0,x_positions.size()-1)
var y_index = randi_range(0,y_positions.size()-1)

var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 30.0
var nose = Vector2(-10,100)

func damage(d):
	Health -= d
	print(Health)
	if Health < 1:
		Global.update_score(500)
		queue_free()	

func _on_timer_timeout():
	var Player = get_node_or_null("/root/Game/Player_Container/Player")
	var Effects = get_node_or_null("/root/Game/Effects")
	if Player != null and Effects != null:
		var bullet = Bullet.instantiate()
		var d = global_position.angle_to_point(Player.global_position) - PI/2
		bullet.rotation = d
		bullet.position = global_position + nose.rotated(d)
		Effects.add_child(bullet) # Replace with function body.


func _on_area_2d_body_entered(body):
	print("Enemy Hit") 
	if body.name != "Enemy":
		damage(body.Damage)
		body.damage(Damage)
		print("Its a hit!")

func _ready():
	initial_position.x = x_positions[x_index]
	initial_position.y = y_positions[y_index]
	position = initial_position

func _physics_process(_delta):
	position += direction
	position.y = initial_position.y + sin(position.x/20)*wobble
	if position.x > 1152:
		position.x = wrapf(position.x, 0.0, Global.VP.x)
	if position.y > 648:
		position.y = wrapf(position.y, 0.0, Global.VP.y)	
