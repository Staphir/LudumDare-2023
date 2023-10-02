extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	show_start_messages()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#set_windows_position()
	pass
func show_message(text):
	$Message.text = text
	$Message.show()

func update_free_book_slots_nb(nb):
	get_node("SpaceRemainingLabel/FreeBookSlotsNb").text = str(nb)

func update_score(score_name,player_name,score):
	get_node(score_name).text = str(get_node(player_name).score)

func show_start_messages():
	get_node("../Player1").set_physics_process(false)
	get_node("../Player2").set_physics_process(false)
	show_message("3")
	await get_tree().create_timer(1).timeout
	show_message("2")
	await get_tree().create_timer(1).timeout
	show_message("1")
	await get_tree().create_timer(1).timeout
	show_message("GO!")
	get_node("../Player1").set_physics_process(true)
	get_node("../Player2").set_physics_process(true)
	await get_tree().create_timer(1.2).timeout
	$Message.hide()
	get_node("../InGameMusic").play()

func game_finished(winner_name):
	get_node("../Player1").set_physics_process(false)
	get_node("../Player2").set_physics_process(false)
	get_node("../EndSound").play()
	get_node("../InGameMusic").stop()
	show_message("OVER BOOKED!")
	await get_tree().create_timer(1).timeout
	$Message.hide()
	await get_tree().create_timer(0.5).timeout
	$Message.show()
	await get_tree().create_timer(1).timeout
	$Message.hide()
	show_winner(winner_name)
	$ReplayButton.show()
	$MainMenuButton.show()
	$ReplayButton.grab_focus()
	
func set_windows_position():
		var screensize = get_viewport().size
		get_node("../Window1").position.x = screensize.x - get_node("../Window1").size.x
		get_node("../Window2").position.x = screensize.x - get_node("../Window2").size.x

func show_winner(player_name):
	if player_name == "":
		show_message("Draw !!!" % [player_name])
	else:
		show_message("Player %s wins !!!" % [player_name])


func _on_replay_button_button_up():
	get_tree().reload_current_scene()


func _on_main_menu_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
