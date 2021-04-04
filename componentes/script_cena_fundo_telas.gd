extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = rand_range(3.0, 4.0)
	$Timer.start()		
	
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AudioStreamPlayer.volume_db = ScriptGlobal.musicaVolume

#Instancia um objeto "Nuvem" na tela e reinicia o Timer
func criar_nuvem():
	var nuvem = preload("res://componentes/nuvem.tscn")
	var objeto_nuvem = nuvem.instance()
	objeto_nuvem.global_position.x = 1950
	objeto_nuvem.global_position.y = rand_range(0, 350)
	get_tree().root.add_child(objeto_nuvem)
	
	$Timer.wait_time = rand_range(3.0, 4.0)
