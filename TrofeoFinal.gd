extends Area2D

export(String) var siguiente_escena

func _physics_process(delta):
	var personaje=get_overlapping_bodies()
	
	for obj in personaje:
		if obj.is_in_group("personaje"):
			get_tree().change_scene(siguiente_escena)

	
