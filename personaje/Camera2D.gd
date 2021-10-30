extends Camera2D



func _physics_process(delta):
	
	var ypersonaje=get_tree().get_nodes_in_group("personaje")[0].global_position.y
	
	if ypersonaje>10:
		global_position.y=300
	else:
		global_position.y=-100
	
	
