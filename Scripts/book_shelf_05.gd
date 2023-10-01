extends Node3D

const glow_material = preload("res://Objects/Materials/glowmaterial.tres")

@onready var near = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	$WallBookshelf.material_overlay = glow_material
	near = true


func _on_area_3d_body_exited(body):
	$WallBookshelf.material_overlay = null
	near = false
