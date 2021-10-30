extends Area2D

func _physics_process(delta):
	
	var cuerpo=get_overlapping_bodies()
	var vivo=get_tree().get_nodes_in_group("main")[0].vidas
	
	for objeto in cuerpo:
		if objeto.is_in_group("personaje") and vivo>0:
			objeto.quitar_vidas()
		if vivo==0:
			get_tree().change_scene("res://tscn/gameOver.tscn")
