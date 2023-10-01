extends Node2D

signal finished
@export var mob_book_grid_scene: PackedScene

@export var nb_slots_available = 2
var nb_slots_total = 5
var mini_game_finished = false
var bookshelf
var player_id = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_mob_book_grid()
	$Book.player_id = player_id
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_mob_book_grid():
	var mob_book_grid = mob_book_grid_scene.instantiate()
	mob_book_grid.nb_mob_books = 8 - bookshelf.free_slots
	add_child(mob_book_grid)
	



func _on_book_book_placed_sig():
	emit_signal("finished")
	bookshelf.free_slots -= 1
	mini_game_finished = true
