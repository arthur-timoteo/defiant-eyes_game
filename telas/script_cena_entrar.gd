extends Node2D

func botao_entrar():
	get_tree().change_scene("res://telas/cena_autenticado.tscn")

func botao_voltar_para_tela_inicial():
	get_tree().change_scene("res://telas/cena_inicial.tscn")
