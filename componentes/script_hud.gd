extends CanvasLayer

func _ready():
	$TempoAcabou.visible = false
	$PersonagemMorreu.visible = false
	$Control3/Timer.wait_time = ScriptGlobal.TempoDaFase
	$Control3/Timer.start()

func _process(delta):
	$Control2/QuantSpinners.text = String(ScriptGlobal.QuantidadeSpinner)
	$Control4/NumVidas.text = String(ScriptGlobal.QuantidadeVida)
	$Control1/Pontos.text = String(ScriptGlobal.QuantidadePontos)
	$Control3/Tempo.text = str(int($Control3/Timer.time_left))
	
	if(ScriptGlobal.PersonagemMorreu && $PersonagemMorreu/Timer.is_stopped()):
		$PersonagemMorreu/Timer.start()

func _tempo_fase_acabou():
	$Control3/Timer.stop()
	get_tree().paused = not get_tree().paused
	$TempoAcabou.visible = true
	$TempoAcabou/AudioStreamPlayer.play()
	yield(get_tree().create_timer(6), "timeout")
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://telas/cena_fases.tscn")

func _personagem_morreu():
	$PersonagemMorreu/Timer.paused = true
	$Control3/Timer.stop()
	get_tree().paused = not get_tree().paused
	$PersonagemMorreu.visible = true
	$PersonagemMorreu/AudioStreamPlayer1.play()
	yield(get_tree().create_timer(6), "timeout")
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://telas/cena_fases.tscn")


