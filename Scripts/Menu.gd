extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_start_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_quit_button_button_up():
	get_tree().quit()
