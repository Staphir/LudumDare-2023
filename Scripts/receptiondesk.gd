extends MeshInstance3D

const glow_material = preload("res://Objects/Materials/glowmaterial.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	material_overlay = glow_material
	print("enter")


func _on_area_3d_body_exited(body):
	material_overlay = null
	print("exit")
