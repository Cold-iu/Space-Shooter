extends Area2D

var speed = 10
var Damage = 2
var velocity = Vector2.ZERO
var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null


func _ready():
	velocity = Vector2(0,speed).rotated(rotation) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + velocity
	position.x = wrapf(position.x, 0.0, 1152.0)
	position.y = wrapf(position.y, 0.0, 648.0)	
	
	

func _on_timer_timeout():
	queue_free() # Replace with function body.



func _on_body_entered(body):
	body.Health -= Damage
	print(body, "Took damage")
	print(body.Health)
	if body.Health <= 0:
		body.queue_free()
		var Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instantiate()
			Effects.add_child(explosion)
			explosion.global_position = global_position
			hide()
			await explosion.animation_finished
		Global.Score += 1
		print(Global.Score)
	queue_free()
	

