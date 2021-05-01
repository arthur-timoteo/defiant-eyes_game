extends KinematicBody2D

export var velocidade = 64
export var vida = 2
var movimentacao = Vector2.ZERO
var direcao_movimento = 1
var gravidade = 1200
var atingido = false

export var movimentacao_rayCast = false
export var esquerda_maxima = 800
export var direita_maxima = 1000

func _ready():
	if(!movimentacao_rayCast):
		$RayCast2D.enabled = false

func _physics_process(delta):	
	movimentacao.y += gravidade * delta 
	
	if(!atingido):
		movimentacao.x = velocidade * direcao_movimento
		
		if(direcao_movimento == -1):
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false
		
		if(movimentacao_rayCast):
			if(!$RayCast2D.is_colliding()):
				$AnimationPlayer.play("parado")
				movimentacao.x = 0
		else:
			if($".".global_position.x <= esquerda_maxima && direcao_movimento == -1):
				$AnimationPlayer.play("parado")
				movimentacao.x = 0
				
			if($".".global_position.x >= direita_maxima && direcao_movimento == 1):
				$AnimationPlayer.play("parado")
				movimentacao.x = 0
			
	else:
		movimentacao.x = 0
		
	movimentacao = move_and_slide(movimentacao)

func _animacao_personagem_terminou(anim_name):
	if(anim_name == 'parado'):
		$Sprite.flip_h != $Sprite.flip_h
		if(movimentacao_rayCast):
			$RayCast2D.position.x *= -1
		direcao_movimento *= -1
		$AnimationPlayer.play("andando")

func colidiu_com_inimigo(area):
	if(area.name == "AtaqueMarreta"):
		vida -= 1
	else:
		vida -= 2	

	atingido = true
	
	if(vida <= 0):
		$".".set_collision_layer(0)
		$CaixaAtaque.queue_free()
		$AudioStreamPlayer2.play()
		$AnimationPlayer.play("morrendo")
		yield(get_tree().create_timer(0.6), "timeout")
		queue_free()
	else:
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("atingido")
		yield(get_tree().create_timer(0.3), "timeout")
		$AnimationPlayer.play("andando")
		atingido = false
