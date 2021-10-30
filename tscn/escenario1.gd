extends Node2D


var monedas=0
var vidas=3
var listaVidas=[]
var nuevaPos=60

export (PackedScene) var vidax

func _ready():
	crear_vida()


func crear_vida():
	for i in vidas:
		var nueva_vida=vidax.instance()
		get_tree().get_nodes_in_group("gui")[0].add_child(nueva_vida)
		nueva_vida.global_position.x+=i*nuevaPos
		listaVidas.append(nueva_vida)

func quitar_vida():
	vidas-=1
	var ultimo=listaVidas.size()-1
	listaVidas[vidas].queue_free()
	listaVidas.remove(ultimo)	

func agregarVida():
	var y=vidas
	var unaMas=vidax.instance()
	get_tree().get_nodes_in_group("gui")[0].add_child(unaMas)
	unaMas.global_position.x+=y*nuevaPos
	listaVidas.append(unaMas)
	vidas+=1


func _physics_process(delta):
	get_node("gui/monedas").text=String(monedas)
	get_node("gui/vidas").text=String(vidas)
