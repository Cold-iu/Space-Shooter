extends CharacterBody2D

var Bullet = load("res://Enemy/Enemy_Bullet.tscn")
var Damage = 10
var Health = 10
var y_positions = [100,150,200,500,550]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 30.0
var nose = Vector2(-10,100)

func damage(d):
	Health -= d
	print(Health)
	if Health < 1:
		Global.update_score(300)
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
	initial_position.x = -100
	initial_position.y = y_positions[randi() % y_positions.size()]
	position = initial_position

func _physics_process(_delta):
	position += direction
	position.y = initial_position.y + sin(position.x/20)*wobble
	if position.x > 1200:
		queue_free()
