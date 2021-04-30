extends Node

var minimumSize = Vector2(1024, 600)
var spinner_mov = Vector2(10, 0.5)

func _ready():
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_EXPAND, minimumSize, 1)

var musicaVolume = -5
var sonsVolume = -5

var telaOrigemAteOpcoes = ""

var faseAtual = 2

var QuantidadeSpinner = 0
var QuantidadeVida = 0
