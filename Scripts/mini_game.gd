extends Node2D

@export var mob_book_grid_scene: PackedScene

@export var nb_slots_available = 2
var nb_slots_total = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_mob_book_grid()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_mob_book_grid():
	var mob_book_grid = mob_book_grid_scene.instantiate()
	add_child(mob_book_grid)
