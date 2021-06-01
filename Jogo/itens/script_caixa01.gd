extends KinematicBody2D

export var pontos = 20
var numero_pisadas = 0

func _ready():
	#Gera aleatóriamente o número de quantas vezes a caixa pode ser pisada
	numero_pisadas = randi() % 5 + 1
	
	$AudioStreamPlayer.volume_db = ScriptGlobal.sonsVolume
	$AudioStreamPlayer2.volume_db = ScriptGlobal.sonsVolume

func personagem_pisou(body: Node) -> void:
	if(body.name == "AtaqueMarreta" || body.name == "Spinner"):
		destruir_caixa()
	elif body.name == "Personagem":
		$AnimationPlayer.play("pisada")
		$AudioStreamPlayer.play()
		body.movimentacao.y -= 600
		ScriptGlobal.QuantidadePontos += int(pontos / 3)
		numero_pisadas -= 1
		
	if(numero_pisadas == 0):
		destruir_caixa()

func destruir_caixa():
	ScriptGlobal.QuantidadePontos += pontos
	ScriptGlobal.caixasQuebradas += 1
	$AudioStreamPlayer2.play()
	$CaixaAtaque1.queue_free()
	$CaixaAtaque2.queue_free()
	$Sprite.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	yield(get_tree().create_timer(0.15), "timeout")
	queue_free()
