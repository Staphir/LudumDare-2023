extends Control

var step = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	#$NextButton.grab_focus()
	$StartButton.hide()
	$NextButton.show()
	$NextButton.grab_focus()
	$Step0.show()
	$Step1.hide()
	$Step2.hide()
	$Step3.hide()
	$Step4.hide()
	$Step5.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_button_button_up():
	if step == 0:
		step +=1
		$Step0.hide()
		$Step1.show()
		$Rules.text = "Take a book at the reception desk!"
		$ControlRules.text = "On Keyboard:
			- Player 1 press ENTER
			- Player 2 press R
			On Controller:
			- both Players press A"
	elif step == 1:
		step +=1
		$Step1.hide()
		$Step2.show()
		$Rules.text = "Find free slots when close to a bookshelf!
		If a free slot is there library will open!
		 "
		$ControlRules.text = "On Keyboard:
			- Player 1 press ENTER
			- Player 2 press R
			On Controller:
			- both Players press A"
	elif step == 2:
		step +=1
		$Step2.hide()
		$Step3.show()
		$Rules.text = "If a free slot or more is there, quickly place the book!"
		$ControlRules.text = "On Keyboard:
		- Player 1 press SPACE
		- Player 2 press F
		On Controller 
		- both Players press B"
	elif step == 3:
		step +=1
		$Step3.hide()
		$Step4.show()
		$Rules.text = "Be careful, only a limited number of slots is there!
		Game finishes when library is full."
		$ControlRules.text = ""
	else:
		$Step4.hide()
		$Step5.show()
		$Rules.text = "Reminder of all the controls. 
		Always available when pausing the game (escape/start)"
		$ControlRules.text = ""
		$NextButton.hide()
		$StartButton.show()
		$StartButton.grab_focus()
			


func _on_next_button_2_button_up(): #start button
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
