extends Node2D

func _ready():
	$Timer.wait_time = rand_range(3.0, 4.0)
	$Timer.start()		
	
	$AudioStreamPlayer.play()

func _process(_delta):
	$AudioStreamPlayer.volume_db = ScriptGlobal.musicaVolume

#Gera as Nuvens em posições randômicas toda vez que o Timer chega a 0
func criar_nuvem():
	var nuvem = preload("res://componentes/nuvem.tscn")
	var objeto_nuvem = nuvem.instance()
	objeto_nuvem.global_position.x = 1950
	objeto_nuvem.global_position.y = rand_range(0, 350)
	get_tree().root.add_child(objeto_nuvem)
	
	$Timer.wait_time = rand_range(3.0, 4.0)
