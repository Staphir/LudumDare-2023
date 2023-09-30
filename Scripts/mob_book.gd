extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var textures = [
		load("res://Objects/Textures/book1.png"),
		load("res://Objects/Textures/book2.png"),
		load("res://Objects/Textures/book3.png")
		]
	$Sprite2D.texture = textures[randi_range(0,textures.size()-1)]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
