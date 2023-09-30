extends Node2D

@export var mob_book_scene: PackedScene
@export var shelf_y_pos = 200
@export var nb_slots_available = 2
var nb_slots_total = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_mob_book()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_mob_book():
	var mob_book = mob_book_scene.instantiate()
	mob_book.position = Vector2(200,shelf_y_pos)
	mob_book.show()
	add_child(mob_book)
