extends KinematicBody2D

var movimiento=Vector2()
var UP=Vector2(0,-1)
var gravedad=200
var velocidad=250
var direccion= -1
var enTierra= false
var activo=false


func _physics_process(delta):
	
	if activo:
		
		movimiento.y+=gravedad*delta
		
		if enTierra:
			movimiento.x=velocidad*direccion
		
		if is_on_wall():
			direccion=direccion*-1
			global_position.x+=10*direccion
			if direccion==-1:
				$sprite.flip_h=false
				$RayCast2D.position.x=-100
			else:
				$sprite.flip_h=true
				$RayCast2D.position.x=100

		if is_on_floor():
			enTierra=true
			
		if get_slide_count():
			for i in range(get_slide_count()):
				if "personaje" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.quitar_vidas()
		
		if $RayCast2D.is_colliding()==false and enTierra:
			direccion*=-1
			if direccion==-1:
				$sprite.flip_h=false
				$RayCast2D.position.x=-100
			else:
				$sprite.flip_h=true
				$RayCast2D.position.x=100
		
			
		movimiento=move_and_slide(movimiento,UP)

func morir():
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	activo=true


func _on_VisibilityNotifier2D_screen_exited():
	activo=false
