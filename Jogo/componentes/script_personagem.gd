extends KinematicBody2D

const ceu = Vector2(0, -1)
const gravidade = 1200
const velocidade = 400
const pulo_altura = -650
var movimentacao = Vector2()
var no_chao
var atacando1
var atacando2
var vida = 1
var recebeu_dano = false

export var CameraLimiteAbaixo = 0
export var CameraLimiteDireta = 0
export var CameraLimiteAcima = 0
export var CameraLimiteEsquerda = 0

func _ready():
	$Camera2D.limit_bottom = CameraLimiteAbaixo
	$Camera2D.limit_right = CameraLimiteDireta
	$Camera2D.limit_left = CameraLimiteEsquerda
	$Camera2D.limit_top = CameraLimiteAcima
	$AudioStreamPlayer.volume_db = ScriptGlobal.sonsVolume
	$AudioStreamPlayer2.volume_db = ScriptGlobal.sonsVolume

func _physics_process(delta):
	movimentacao.y += gravidade * delta
	
	var animacao = "parado"
	
	movimentacao.x = 0
	var direcao_movimento = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movimentacao.x = velocidade * direcao_movimento
	
	if(!recebeu_dano):
		if direcao_movimento != 0:
			if direcao_movimento < 0 && $".".get_transform().get_scale().y > 0:
				$".".scale.x *= -1
				ScriptGlobal.spinner_mov = Vector2(-10, 0.5)
			elif direcao_movimento > 0 && $".".get_transform().get_scale().y < 0:
				$".".scale.x *= -1
				ScriptGlobal.spinner_mov = Vector2(10, 0.5)
		
		movimentacao = move_and_slide(movimentacao, ceu)
			
		no_chao = is_on_floor()
		
		if is_on_floor() && Input.is_action_just_pressed("ui_up"):
			movimentacao.y = pulo_altura
			
		if Input.is_action_just_pressed("ui_atq_marreta") && !atacando1 &&!atacando2:
			atacando1 = true
			yield(get_tree().create_timer(0.3), "timeout")
			atacando1 = false
			
		if Input.is_action_just_pressed("ui_atq_spinner") && !atacando2 &&!atacando1:
			atacando2 = true
			yield(get_tree().create_timer(0.2), "timeout")
			atacando2 = false
			spinner_ataque()
	
	if recebeu_dano:
		animacao = "dano"
	elif atacando1:
		animacao = "ataque_marreta"		
	elif atacando2:
		animacao = "ataque_spinner"	
	elif !no_chao:
		animacao = "pulando"
	elif movimentacao.x != 0:
		animacao = "andando"
		
	if $AnimationPlayer.assigned_animation != animacao:
		$AnimationPlayer.play(animacao)
	
	#Verifica se o Personagem colidiu com alguma plataforma que cai
	for plataformas in get_slide_count():
		var colisao = get_slide_collision(plataformas)
		if(colisao.collider.has_method("personagem_plataforma_cai")):
			colisao.collider.personagem_plataforma_cai(colisao, self)
	

func _colidiu_com_inimigo(_body):
	recebeu_dano = true
	$AudioStreamPlayer2.play()
	ScriptGlobal.QuantidadeVida -= 1
	if(ScriptGlobal.QuantidadeVida <= 0):
		ScriptGlobal.QuantidadeVida = 0
		ScriptGlobal.PersonagemMorreu = true
	else:
		yield(get_tree().create_timer(0.4), "timeout")
		recebeu_dano = false

func spinner_ataque():
	if(ScriptGlobal.QuantidadeSpinner > 0):
		ScriptGlobal.QuantidadeSpinner -= 1
		var cena_spinner_ataque = preload("res://componentes/spinner_giro.tscn")
		var objeto_spinner = cena_spinner_ataque.instance()
		objeto_spinner.global_position = $OrigemSpinner.global_position
		get_tree().root.add_child((objeto_spinner))
