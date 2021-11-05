extends KinematicBody2D

const UP=Vector2(0,-1)
const xbala=preload("res://tscn/poder.tscn")

var gravedad=10
var velocidad=300
var entierra=false
var salto=-700
var movimiento=Vector2()
var herido=false
var direccion=1
var atacando=false

func _physics_process(delta):
	
	movimiento.y+=gravedad
	
	if global_position.y>=1200:
		gameOver()
	
	
	if Input.is_action_pressed("adelate") and !atacando:
		direccion=1
		movimiento.x=velocidad
		$Position2D.position.x=206
		$Sprite.flip_h=false
		if entierra:
			$Sprite.play("correr")	
		else:
			$Sprite.play("saltar")
	elif Input.is_action_pressed("atras") and !atacando:
		direccion=-1
		movimiento.x=-velocidad
		$Position2D.position.x=-206
		$Sprite.flip_h=true
		if entierra:
			$Sprite.play("correr")	
		else:
			$Sprite.play("saltar")
	else:
		movimiento.x=0
		if entierra:
			$Sprite.play("idle")	
		else:
			$Sprite.play("saltar")
		
		
	if is_on_floor():
		entierra=true
	else:
		entierra=false
	
	if Input.is_action_pressed("saltar") and !atacando:
		if entierra==true:
			movimiento.y=salto
			$Sprite.play("saltar")
	
	#La tecla para disparar es: Q
	if Input.is_action_just_pressed("disparar") and !atacando:
		movimiento.x=0
		atacando=true
		var bala=xbala.instance()
		get_parent().add_child(bala)
		bala.position=$Position2D.global_position
		bala.direccionBala(direccion) #cambio direccion bala
		yield(get_tree().create_timer(0.5),"timeout")
		atacando=false
	
	
	if get_slide_collision(get_slide_count()-1)!=null:
		var objcol=get_slide_collision(get_slide_count()-1).collider
		if objcol.is_in_group("enemigo"):
			quitar_vidas()
	
	movimiento=move_and_slide(movimiento,UP)


	
func quitar_vidas():
	var v=get_tree().get_nodes_in_group("main")[0].vidas
	if !herido and v>0:
		herido=true
		get_tree().get_nodes_in_group("main")[0].quitar_vida()
		global_position.x-=100*direccion
		$Timer.start()
	if v==1:
		gameOver()

func gameOver():
	get_tree().change_scene("res://tscn/gameOver.tscn")

func _on_Timer_timeout():
	herido=false
