extends Node2D

var velocidade_spinner = 0

func _ready():
	velocidade_spinner = ScriptGlobal.spinner_mov

func _process(_delta):
	translate(velocidade_spinner)

func _algo_colidiu_com_spinner(_body):
	queue_free()		
	
#Destroi o Spinner se ele sair da área da tela
func _spinner_saiu_da_tela():
	queue_free()
