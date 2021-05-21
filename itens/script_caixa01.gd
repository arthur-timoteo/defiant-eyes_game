extends KinematicBody2D

export var pontos = 20

func personagem_pisou(body: Node) -> void:
	if(body.name == "AtaqueMarreta" || body.name == "Spinner"):
		$AudioStreamPlayer2.play()
		$CaixaAtaque1.queue_free()
		$CaixaAtaque2.queue_free()
		$Sprite.visible = false
		$CollisionShape2D.set_deferred("disabled", true)
		yield(get_tree().create_timer(0.15), "timeout")
		queue_free()
	elif body.name == "Personagem":
		$AnimationPlayer.play("pisada")
		$AudioStreamPlayer.play()
		body.movimentacao.y -= 600
