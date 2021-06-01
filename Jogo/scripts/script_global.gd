extends Node

var minimumSize = Vector2(1024, 600)
var spinner_mov = Vector2(10, 0.5)

func _ready():
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_EXPAND, minimumSize, 1)

#Opções
var musicaVolume = -5
var sonsVolume = -5
var DificuldadeJogo = 1
var telaOrigemAteOpcoes = ""

#Controle Fase
var faseMaxima = 1
var faseAtual = 1
var QuantidadeSpinner = 0
var QuantidadeVida = 0
var QuantidadePontos = 0
var TempoDaFase = 100
var PersonagemMorreu = false
var PersonagemChegouFimFaseAtual = false
var caminhoDirecionarDepoisDeSalvarAndamento = ""

#Métricas
var tempoGasto = 0
var inimigosMatados = 0
var caixasQuebradas = 0

#Back-end
var BdURL = "http://olhosdesafiantes.eu5.org"

#Jogador
var IdJogador = 0
var NomeJogador = ""

func resetarMetricas():
	tempoGasto = 0
	inimigosMatados = 0
	caixasQuebradas = 0
