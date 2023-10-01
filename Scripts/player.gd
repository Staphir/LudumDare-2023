extends CharacterBody3D


@export var player_id = 1
#movement vars
@export var MAX_SPEED = 15
@export var ACCELERATION = 110
@export var FRICTION = 100
@export var ANGULAR_ACCELERATION = 7

@onready var axis = Vector3.ZERO
@onready var have_book = false
@onready var score = 0

func _ready():
	$Book.set_visible(false)

func _physics_process(delta):
	move(delta)
	
	if Input.is_action_pressed("select_desk_%s" % [player_id]):
		if get_node("../ReceptionDesk").near and !have_book:
			$Book.set_visible(true)
			have_book = true
		var bookshelves = get_tree().get_nodes_in_group("bookshelves")
		for bookshelf in bookshelves:
			if bookshelf.near and have_book:
				print("Bookshelf %s has %s slots" % [bookshelf.name, str(bookshelf.free_slots)])
				get_node("../Window%s" % [player_id]).init_mini_game(bookshelf)
				$Book.set_visible(false)
				have_book = false
				break
			


#----------------------- BEGIN movement functions ------------------

func get_input_axis():
	axis.x = int(Input.is_action_pressed("move_right_%s" % [player_id])) - int(Input.is_action_pressed("move_left_%s" % [player_id]))
	axis.z = int(Input.is_action_pressed("move_down_%s" % [player_id])) - int(Input.is_action_pressed("move_up_%s" % [player_id]))
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	if axis == Vector3.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
		rotation.y = lerp_angle(rotation.y, atan2(axis.x, axis.z), delta * ANGULAR_ACCELERATION)
		
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector3.ZERO

func apply_movement(acceleration):
	velocity += acceleration
	velocity = velocity.limit_length(MAX_SPEED)

#----------------------- END movement functions ------------------

