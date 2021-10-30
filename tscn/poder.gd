extends Area2D


const velocidad= 1024
var mov=Vector2()
var direccion=1


func _physics_process(delta):
	mov.x=velocidad*direccion*delta
	translate(mov)
	if direccion==1:
		$Sprite.flip_h=false
	else:
		$Sprite.flip_h=true

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_poder_body_entered(body):
	if body.is_in_group("enemigo"):
		body.morir()
		queue_free()
		
		
func direccionBala(dir):
	#print(direccion)
	direccion=dir
