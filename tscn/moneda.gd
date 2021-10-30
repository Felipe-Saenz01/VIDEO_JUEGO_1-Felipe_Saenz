extends Area2D


func _physics_process(delta):
	
	var cuerpo=get_overlapping_bodies()
	
	for objeto in cuerpo:
		if objeto.is_in_group("personaje"):
			get_tree().get_nodes_in_group("main")[0].monedas+=1
			queue_free()


