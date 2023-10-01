extends Window

@export var mini_game_scene: PackedScene
@export var nb_player = 2
@export var player_id = 1
var mini_game
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug_win"):
		var bookshelf = null
		init_mini_game(bookshelf)
	if mini_game:
		if mini_game.mini_game_finished:
			get_node("../Player%s" % [player_id]).set_physics_process(true)
			mini_game.mini_game_finished = false
			get_node("../Player%s" % [player_id]).score += 1
			get_node("../GameManager").current_nb_free_slots -= 1
			hide()



func init_mini_game(bookshelf):
	#remove anay eventual existing instance before creating new one
	if mini_game:
		mini_game.queue_free()
	if bookshelf.free_slots > 0:
		mini_game = mini_game_scene.instantiate()
		mini_game.bookshelf = bookshelf
		mini_game.player_id = player_id
		add_child(mini_game)
		show()
