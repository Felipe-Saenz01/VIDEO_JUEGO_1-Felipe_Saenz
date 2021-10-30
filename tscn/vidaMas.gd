extends Area2D



func _physics_process(delta):
	var personaje=get_overlapping_bodies()
	
	for obj in personaje:
		if obj.is_in_group("personaje"):
			get_tree().get_nodes_in_group("main")[0].agregarVida()
			queue_free()
