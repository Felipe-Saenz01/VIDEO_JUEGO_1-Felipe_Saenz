extends Button



func _on_reiniciar_button_down():
	get_tree().change_scene("res://tscn/Start.tscn")


func _on_salir_button_down():
	get_tree().quit()
