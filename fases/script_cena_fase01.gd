extends Node2D

func _ready():
	ScriptGlobal.QuantidadeSpinner = 0
	ScriptGlobal.QuantidadePontos = 0
	ScriptGlobal.PersonagemMorreu = false
	ScriptGlobal.PersonagemChegouFimFaseAtual = false
	$AudioStreamPlayer.volume_db = ScriptGlobal.musicaVolume
	ScriptGlobal.resetarMetricas()

func limpar_objeto(area):
	if(area.name == "spinner"):
		area.queue_free()
