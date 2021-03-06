extends CanvasLayer

func mudar_cena(caminho, atraso = 0.5):
	$Tween.interpolate_property($ColorRect, "progresso", 0.0, 1.0, 2.0, Tween.TRANS_QUINT, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	ScriptGlobal.caminhoDirecionarDepoisDeSalvarAndamento = caminho
	assert(get_tree().change_scene("res://telas/cena_salvar_andamento.tscn") == OK)
