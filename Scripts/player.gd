extends CharacterBody3D


@export var MAX_SPEED = 15
@export var ACCELERATION = 110
@export var FRICTION = 100
@export var ANGULAR_ACCELERATION = 7

@onready var axis = Vector3.ZERO


func _physics_process(delta):
	move(delta)


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
	
