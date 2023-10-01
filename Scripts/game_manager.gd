extends Node

@export var nb_free_slots = 5
@export var gamemode = 0 #1 is multiplayer, 0 is solo
# Called when the node enters the scene tree for the first time.
func _ready():
	init_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func init_game():
	get_node("../Player1").score = 0
	if gamemode == 1:
		get_node("../Player1").score = 0
		get_node("../Player2").score = 0
	init_bookshelves()
	update_HUD()

func init_bookshelves():
	var assignment =Array() # array with list of free slots where total is nb_free_slots
	var bookshelves = get_tree().get_nodes_in_group("bookshelves")
	var free_slot_to_assign = nb_free_slots
	# assign to bookshelves a random numbe of free slots
	while(free_slot_to_assign > 0):
		var assign_free_slots = randi_range(0,1)
		free_slot_to_assign -= assign_free_slots
		randi_range(0,bookshelves.size()-1)
		print(bookshelves[0].free_slots)
		bookshelves[0].free_slots = bookshelves[0].free_slots + assign_free_slots
		
func update_HUD():
	get_node("../HUD").update_free_book_slots_nb(nb_free_slots)
	get_node("../HUD").update_score("ScoreLabel/ScoreP1Label/ScoreP1Val", "../Player1", get_node("../Player1").score)
	if gamemode == 1:
		get_node("../HUD").update_score("ScoreLabel/ScoreP2Label/ScoreP2Val", "../Player2", get_node("../Player2").score)
