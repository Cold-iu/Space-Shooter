extends Control

var Indicator = load("res://UI/indicator.tscn")
var lives_Pos = Vector2(20,648-20)
var lives_index = 30

func _ready():
	update_score()
	update_lives()

	
	
func update_score():
	$Score.text = "Score: " + str(Global.Score)


func update_lives():
	for child in $Indicator_Container.get_children():
		child.queue_free()
	for l in range(Global.lives):
		var indicator = Indicator.instantiate()
		indicator.position = lives_Pos + Vector2(lives_index * l,0)
		$Indicator_Container.add_child(indicator)
		



