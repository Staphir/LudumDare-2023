extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	show_start_messages()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	show_message("3")
	await get_tree().create_timer(1).timeout
	show_message("2")
	await get_tree().create_timer(1).timeout
	show_message("1")
	await get_tree().create_timer(1).timeout
	show_message("GO!")
	get_node("../Player1").set_physics_process(true)
	await get_tree().create_timer(1.2).timeout
	$Message.hide()

func game_finished():
	show_message("OVER BOOKED!")
	get_node("../Player1").set_physics_process(false)
	await get_tree().create_timer(2).timeout
	$Message.hide()
