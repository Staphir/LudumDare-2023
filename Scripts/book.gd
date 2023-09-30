extends Area2D

@export var speed = 200

signal hit #to notice collicion

var screensize
var velocity
var collision_counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = false
	screensize = get_viewport_rect().size
	velocity = Vector2(speed,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screensize)
	
	if position.x == screensize.x:
		velocity *= -1
	if position.x == 0:
		velocity *= -1


func _on_body_entered(body):
	print("Collision with other books")
	pass # Replace with function body.

func is_colliding():
	if collision_counter > 0:
		return true



func _on_area_entered(area):
	collision_counter += 1
	print("collision ctr: ", collision_counter)


func _on_area_exited(area):
	collision_counter -= 1
	print("collision ctr: ", collision_counter)
