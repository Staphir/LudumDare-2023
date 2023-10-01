extends Node3D

const glow_material = preload("res://Objects/Materials/glowmaterial.tres")

@onready var near = false
var free_slots = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	$BookShelf02.material_overlay = glow_material
	near = true


func _on_area_3d_body_exited(body):
	$BookShelf02.material_overlay = null
	near = false
