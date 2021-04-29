extends KinematicBody2D

export var velocidade = 64
export var vida = 1
var movimentacao = Vector2.ZERO
var direcao_movimento = -1
var gravidade = 1200

export var esquerda_maxima = 800
export var direita_maxima = 1000

func _physics_process(delta):
	movimentacao.x = velocidade * direcao_movimento
	movimentacao.y += gravidade * delta 
	
	if(direcao_movimento == -1):
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
		
	if($".".global_position.x <= esquerda_maxima && direcao_movimento == -1):
		$AnimationPlayer.play("parado")
		
	if($".".global_position.x >= direita_maxima && direcao_movimento == 1):
		$AnimationPlayer.play("parado")
		
	movimentacao = move_and_slide(movimentacao)

func _animacao_personagem_terminou(anim_name):
	if(anim_name == 'parado'):
		$Sprite.flip_h != $Sprite.flip_h
		direcao_movimento *= -1
		$AnimationPlayer.play("andando")
