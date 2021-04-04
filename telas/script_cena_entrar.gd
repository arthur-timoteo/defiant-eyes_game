extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func botao_entrar():
	get_tree().change_scene("res://telas/cena_autenticado.tscn")

func botao_voltar_para_tela_inicial():
	get_tree().change_scene("res://telas/cena_inicial.tscn")
