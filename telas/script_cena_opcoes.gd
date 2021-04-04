extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Node2D/SldMusica.value = ScriptGlobal.musicaVolume
	$Node2D/SldSons.value = ScriptGlobal.sonsVolume

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ScriptGlobal.musicaVolume = $Node2D/SldMusica.value
	ScriptGlobal.sonsVolume = $Node2D/SldSons.value
	
func botao_voltar_cena_autenticado():
	if(ScriptGlobal.telaOrigemAteOpcoes == "cena_inicial"):
		get_tree().change_scene("res://telas/cena_inicial.tscn")
	else:
		get_tree().change_scene("res://telas/cena_autenticado.tscn")
