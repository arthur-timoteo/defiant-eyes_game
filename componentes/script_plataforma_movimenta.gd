extends Node2D

onready var plataforma = $KinematicBody2D
onready var tween = $Tween

export var velocidade = 3.0
export var movimentacao_horizontal = true
export var distancia = 192

var seguir = Vector2.ZERO

const TEMPO_ESPERA = 2.25

func _ready():
	_iniciar_tween()

func _iniciar_tween():
	var direcao_movimento = Vector2.RIGHT * distancia if movimentacao_horizontal else Vector2.UP * distancia
	var duracao = direcao_movimento.length() / float(velocidade * 16)
	tween.interpolate_property(
		self, 				#Objeto que será animado
		"seguir",					#A propriedade que será animada
		Vector2.ZERO,				#Valor inicial
		direcao_movimento,			#Valor final
		duracao,					#Duração da animação
		Tween.TRANS_LINEAR,			#Tipo de Tween
		Tween.EASE_IN_OUT,			#Tipo suavização
		TEMPO_ESPERA				#Atraso
	)	
	tween.interpolate_property(
		self, 
		"seguir",
		direcao_movimento,
		Vector2.ZERO,
		duracao,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		duracao + TEMPO_ESPERA * 2
	)
	tween.start()
	
func _physics_process(delta):
	plataforma.position = plataforma.position.linear_interpolate(seguir, 0.05)
