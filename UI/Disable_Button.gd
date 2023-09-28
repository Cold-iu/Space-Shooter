extends Button


# A variable that stores the level completion status
var level_completed = false

func _ready():
	# Connect the button's pressed signal to a function that checks the level status
	connect("pressed", self, "_on_Button_pressed")
	# Connect the SceneTree's scene_changed signal to a function that deletes the button
	get_tree().connect("scene_changed", self, "_on_scene_changed")

func _on_Button_pressed():
	# Check if the level is completed
	if level_completed:
		# Call a function that disables the button
		_disable_button()
	else:
		# Do something else when the button is pressed
		pass

func _disable_button():
	# Set the button's disabled property to true
	disabled = true
	# Change the button's appearance to indicate that it is disabled
	# For example, you can change its color or modulate property
	modulate = Color(0.5, 0.5, 0.5, 1)

func _on_scene_changed():
	# Check if the level is completed
	if level_completed:
		# Call a function that deletes the button
		_delete_button()

func _delete_button():
	# Remove the button from the scene tree and free its memory
	queue_free()
