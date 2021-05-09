extends CanvasLayer

func mudar_cena(caminho, atraso = 0.5):
	$Tween.interpolate_property($ColorRect, "progresso", 0.0, 1.0, 2.0, Tween.TRANS_QUINT, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	assert(get_tree().change_scene(caminho) == OK)
