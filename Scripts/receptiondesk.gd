extends Node3D

const glow_material = preload("res://Objects/Materials/glowmaterial.tres")

@onready var near_1 = false
@onready var near_2 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	$WallBookshelf02.material_overlay = glow_material
	if body.player_id == 1:
		near_1 = true
	elif body.player_id == 2:
		near_2 = true


func _on_area_3d_body_exited(body):
	$WallBookshelf02.material_overlay = null
	if body.player_id == 1:
		near_1 = false
	elif body.player_id == 2:
		near_2 = false
