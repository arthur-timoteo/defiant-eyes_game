extends CanvasLayer

func _process(delta):
	$Control2/QuantSpinners.text = String(ScriptGlobal.QuantidadeSpinner)
	$Control4/NumVidas.text = String(ScriptGlobal.QuantidadeVida)
	$Control1/Pontos.text = String(ScriptGlobal.QuantidadePontos)
	
