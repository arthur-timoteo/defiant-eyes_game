extends Node2D

func _ready():
	$Node2D/SldMusica.value = ScriptGlobal.musicaVolume
	$Node2D/SldSons.value = ScriptGlobal.sonsVolume

func _process(_delta):
	ScriptGlobal.musicaVolume = $Node2D/SldMusica.value
	ScriptGlobal.sonsVolume = $Node2D/SldSons.value
	
func botao_voltar_cena_autenticado():
	if(ScriptGlobal.telaOrigemAteOpcoes == "cena_inicial"):
		get_tree().change_scene("res://telas/cena_inicial.tscn")
	else:
		get_tree().change_scene("res://telas/cena_autenticado.tscn")
