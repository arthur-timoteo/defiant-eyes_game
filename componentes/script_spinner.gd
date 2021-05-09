extends Node2D

var velocidade_spinner = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	velocidade_spinner = ScriptGlobal.spinner_mov


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocidade_spinner)


func _algo_colidiu_com_spinner(_body):
	queue_free()		
	
func _spinner_saiu_da_tela():
	queue_free()
