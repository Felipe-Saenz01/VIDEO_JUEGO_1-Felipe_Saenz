extends Button



func _on_reiniciar_button_down():
	get_tree().change_scene("res://tscn/escenario1.tscn")


func _on_salir_button_down():
	get_tree().quit()
