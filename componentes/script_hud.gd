extends CanvasLayer

func _ready():
	$Caixa/TempoAcabou.visible = false
	$Caixa/PersonagemMorreu.visible = false
	$Caixa/Control3/Timer.wait_time = ScriptGlobal.TempoDaFase
	$Caixa/Control3/Timer.start()
	$Caixa/TempoAcabou/AudioStreamPlayer.volume_db = ScriptGlobal.sonsVolume
	$Caixa/PersonagemMorreu/AudioStreamPlayer1.volume_db = ScriptGlobal.sonsVolume

func _process(_delta):
	$Caixa/Control2/QuantSpinners.text = String(ScriptGlobal.QuantidadeSpinner)
	$Caixa/Control4/NumVidas.text = String(ScriptGlobal.QuantidadeVida)
	$Caixa/Control1/Pontos.text = String(ScriptGlobal.QuantidadePontos)
	$Caixa/Control3/Tempo.text = str(int($Caixa/Control3/Timer.time_left))
	
	if(ScriptGlobal.PersonagemMorreu && $Caixa/PersonagemMorreu/Timer.is_stopped()):
		$Caixa/PersonagemMorreu/Timer.start()

func _tempo_fase_acabou():
	$Caixa/Control3/Timer.stop()
	get_tree().paused = not get_tree().paused
	$Caixa/TempoAcabou.visible = true
	$Caixa/TempoAcabou/AudioStreamPlayer.play()
	yield(get_tree().create_timer(6), "timeout")
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://telas/cena_fases.tscn")

func _personagem_morreu():
	$Caixa/PersonagemMorreu/Timer.paused = true
	$Caixa/Control3/Timer.stop()
	get_tree().paused = not get_tree().paused
	$Caixa/PersonagemMorreu.visible = true
	$Caixa/PersonagemMorreu/AudioStreamPlayer1.play()
	yield(get_tree().create_timer(6), "timeout")
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://telas/cena_fases.tscn")


