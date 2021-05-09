extends Area2D

func _corpo_entrou_na_vida(_body):
	$Sprite.queue_free()
	$CollisionShape2D.queue_free()
	
	$AudioStreamPlayer.play()
	
	ScriptGlobal.QuantidadeVida += 1

func remover_vida_da_cena():
	queue_free()
