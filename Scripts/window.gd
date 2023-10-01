extends Window

@export var mini_game_scene: PackedScene
@export var nb_player = 2

var mini_game
# Called when the node enters the scene tree for the first time.
func _ready():
	init_mini_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug_win"):
		init_mini_game()
	if mini_game:
		if mini_game.mini_game_finished:
			mini_game.mini_game_finished = false
			get_node("../Player1").score += 1
			get_node("../GameManager").current_nb_free_slots -= 1
			hide()



func init_mini_game():
	#remove anay eventual existing instance before creating new one
	if mini_game:
		mini_game.queue_free()
	mini_game = mini_game_scene.instantiate()
	add_child(mini_game)
	show()
