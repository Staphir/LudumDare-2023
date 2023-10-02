extends Control

var is_paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Window.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		print("pause toogle")
		if not is_paused:
			is_paused = true
			get_tree().paused = true
			$Window.show()
		else:
			is_paused = false
			get_tree().paused = false
			$Window.hide()
			
			
