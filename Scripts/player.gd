extends CharacterBody3D

#movement vars
@export var MAX_SPEED = 15
@export var ACCELERATION = 110
@export var FRICTION = 100
@export var ANGULAR_ACCELERATION = 7

@onready var axis = Vector3.ZERO
@onready var have_book = false

func _ready():
	$Book.set_visible(false)

func _physics_process(delta):
	move(delta)
	
	if Input.is_action_pressed("select_desk"):
		if get_node("../ReceptionDesk").near and !have_book:
			$Book.set_visible(true)
			have_book = true
		if (get_node("../BookShelf_01").near or get_node("../BookShelf_02").near or get_node("../BookShelf_03").near or get_node("../BookShelf_04").near or get_node("../BookShelf_05").near or get_node("../BookShelf_06").near) and have_book:
			get_node("../Window").init_mini_game()
			$Book.set_visible(false)
			have_book = false


#----------------------- BEGIN movement functions ------------------

func get_input_axis():
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.z = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
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

