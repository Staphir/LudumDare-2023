extends Node

@export var nb_free_slots = 16
var current_nb_free_slots = 0
@export var gamemode = 1 #1 is multiplayer, 0 is solo
# Called when the node enters the scene tree for the first time.
func _ready():
	init_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_game()

func init_game():
	current_nb_free_slots = nb_free_slots
	get_node("../Player1").score = 0
	if gamemode == 1:
		get_node("../Player1").score = 0
		get_node("../Player2").score = 0
	init_bookshelves()
	update_HUD()
	
func update_game():
	update_HUD()
	# finish game if library is full
	if current_nb_free_slots <= 0:
		get_node("../HUD").game_finished()
	

func init_bookshelves():
	var assignment =Array() # array with list of free slots where total is nb_free_slots
	var bookshelves = get_tree().get_nodes_in_group("bookshelves")
	var free_slot_to_assign = nb_free_slots
	# assign to bookshelves a random numbe of free slots
	while(free_slot_to_assign > 0):
		var assign_free_slots = randi_range(0,1)
		free_slot_to_assign -= assign_free_slots
		var bookshelf_index = randi_range(0,bookshelves.size()-1)
		print(bookshelves[bookshelf_index].free_slots)
		if bookshelves[bookshelf_index].free_slots < 8:
			bookshelves[bookshelf_index].free_slots += assign_free_slots
		
func update_HUD():
	get_node("../HUD").update_free_book_slots_nb(current_nb_free_slots)
	get_node("../HUD").update_score("ScoreLabel/ScoreP1Label/ScoreP1Val", "../Player1", get_node("../Player1").score)
	if gamemode == 1:
		get_node("../HUD").update_score("ScoreLabel/ScoreP2Label/ScoreP2Val", "../Player2", get_node("../Player2").score)
