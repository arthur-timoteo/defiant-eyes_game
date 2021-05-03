extends KinematicBody2D

export var pontos = 20

func personagem_pisou(body: Node) -> void:
	print(body.name)
	if(body.name == "AtaqueMarreta" || body.name == "Spinner"):
		queue_free()
	elif body.name == "Personagem":
		$AnimationPlayer.play("pisada")
		body.movimentacao.y -= 600
