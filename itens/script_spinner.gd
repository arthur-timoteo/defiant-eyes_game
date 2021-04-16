extends Area2D

func _entrou_no_corpo_do_spinner(body):
	var som_coletado = round(rand_range(1, 5))
	
	$Sprite.queue_free()
	$CollisionShape2D.queue_free()
	
	ScriptGlobal.QuantidadeSpinner += round(rand_range(3, 6))
	
	if(som_coletado == 1):
		$AudioStreamPlayer1.play()
	elif(som_coletado == 2):
		$AudioStreamPlayer2.play()
	elif(som_coletado == 3):
		$AudioStreamPlayer3.play()
	else:
		$AudioStreamPlayer4.play()	

func remover_spinner_da_cena():
	queue_free()
