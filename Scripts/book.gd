extends Area2D

@export var speed = 200

signal book_placed_sig #to notice collicion

var screensize
var velocity
var collision_counter = 0
var init_position = Vector2(0,180.0)
var book_is_placed = false
var player_id = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var textures = [
		load("res://Objects/Textures/book1.png"),
		load("res://Objects/Textures/book2.png"),
		load("res://Objects/Textures/book3.png")
		]
	$BookSprite.texture = textures[randi_range(0,textures.size()-1)]
	init_position.y = 280 - $BookSprite.texture.get_size().y
	print($BookSprite.texture.get_size().y)
	position = init_position
	$CollisionShape2D.disabled = false
	screensize = get_viewport_rect().size
	velocity = Vector2(speed,0)
	#init sprite
	
	





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screensize)
	
	if position.x == screensize.x:
		velocity *= -1
	if position.x == 0:
		velocity *= -1
		
	if not book_is_placed:
		# user tries to put the book in
		if Input.is_action_just_pressed("place_book_%s" %[player_id]):
			if is_colliding():
				position = init_position
			else:
				book_is_placed = true
				velocity = Vector2(0,0)
				#$CollisionShape2D.set_deferred("disabled", true)
				$ScoreIncrease.text = "+1!!!"
				#$ScoreIncrease.show()
				$AnimationPlayer.play("anim_score_increase")
				




func is_colliding():
	if collision_counter > 0:
		return true



func _on_area_entered(area):
	collision_counter += 1
	#print("collision ctr: ", collision_counter)


func _on_area_exited(area):
	collision_counter -= 1
	#print("collision ctr: ", collision_counter)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "anim_score_increase":
		emit_signal("book_placed_sig")

