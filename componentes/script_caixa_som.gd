extends Area2D

onready var mudador = get_parent().get_node("TransicaoIni")
export var caminho : String

func _personagem_encostou(body):
	if(body.name == "Personagem"):
		ScriptGlobal.faseAtual += 1
		mudador.mudar_cena(caminho)
