extends Node2D

func _ready():
	$Node2D/SldMusica.value = ScriptGlobal.musicaVolume
	$Node2D/SldSons.value = ScriptGlobal.sonsVolume
	
	$Node2D/OptnDificuldade.add_item("Fácil")
	$Node2D/OptnDificuldade.add_item("Médio")
	$Node2D/OptnDificuldade.add_item("Difícil")		
	
	$Node2D/OptnDificuldade.select(ScriptGlobal.DificuldadeJogo - 1)

func _process(_delta):
	ScriptGlobal.musicaVolume = $Node2D/SldMusica.value
	ScriptGlobal.sonsVolume = $Node2D/SldSons.value
	
func botao_voltar_cena_autenticado():
	if(ScriptGlobal.telaOrigemAteOpcoes == "cena_inicial"):
		get_tree().change_scene("res://telas/cena_inicial.tscn")
	else:
		get_tree().change_scene("res://telas/cena_autenticado.tscn")


func nivel_dificuldade_selecionado(index):
	ScriptGlobal.DificuldadeJogo = index + 1
