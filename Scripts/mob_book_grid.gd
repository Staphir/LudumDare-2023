extends Node2D

@export var mob_book_scene: PackedScene
@export var shelf_y_pos = 120
@export var nb_mob_books = 6 #Max is 8
var nb_slots = 8
var init_pos_x = 182
var book_size = 52
var spacing = 4
var middle_spacing = 35
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_mob_book()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_mob_book():
	var used_slots = Array()
	nb_mob_books = clamp(nb_mob_books,0,8)
	for n in range(nb_mob_books):
		var mob_book = mob_book_scene.instantiate()
		var slot = randi_range(0,nb_slots-1)
		while used_slots.has(slot): #select the next empty slot
			slot = (slot+1) % nb_slots
		used_slots.append(slot)
		
		var book_x_pos = init_pos_x + book_size * slot + spacing
		if slot >= 4: #second part of the library
			book_x_pos += middle_spacing
			
		
		#print(mob_book.get_node("Sprite2D").texture.get_size().y)
		mob_book.position = Vector2(book_x_pos,shelf_y_pos)
		add_child(mob_book)
		mob_book.position.y = 280 - mob_book.get_node("Sprite2D").texture.get_size().y
