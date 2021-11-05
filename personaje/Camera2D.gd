extends Camera2D



func _physics_process(delta):
	
	var ypersonaje=get_tree().get_nodes_in_group("personaje")[0].global_position.y
	
	if ypersonaje>50:
		global_position.y=300
	if ypersonaje<10:
		global_position.y=-100
	if ypersonaje>500:
		global_position.y=620
	
	
