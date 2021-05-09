extends Node2D

var opcao_selecionada = 1

func _ready():
	$Iniciar.modulate = Color("#ffff00")
	$AudioStreamPlayer.volume_db = ScriptGlobal.sonsVolume

func _process(_delta):
	if(Input.is_action_just_pressed("ui_down") && opcao_selecionada < 3):
		opcao_selecionada += 1
		$AudioStreamPlayer.play()
	elif(Input.is_action_just_pressed("ui_up") && opcao_selecionada > 1):
		opcao_selecionada -= 1
		$AudioStreamPlayer.play()
		
	verificar_opcao_selecionada()
	
	if(Input.is_action_just_pressed("ui_confirm")):
		clicou_na_opcao()

func verificar_opcao_selecionada():
	if(opcao_selecionada == 1):
		$Iniciar.modulate = Color("#ffff00")
		$Opcoes.modulate = Color("#df7126")
		$Controles.modulate = Color("#df7126")
	elif(opcao_selecionada == 2):
		$Iniciar.modulate = Color("#df7126")
		$Opcoes.modulate = Color("#ffff00")
		$Controles.modulate = Color("#df7126")
	else:
		$Iniciar.modulate = Color("#df7126")
		$Opcoes.modulate = Color("#df7126")
		$Controles.modulate = Color("#ffff00")
		
func clicou_na_opcao():
	if(opcao_selecionada == 1):
		get_tree().change_scene("res://telas/cena_fases.tscn")
	elif(opcao_selecionada == 2):
		ScriptGlobal.telaOrigemAteOpcoes = "cena_autenticado"
		get_tree().change_scene("res://telas/cena_opcoes.tscn")
	else:
		get_tree().change_scene("res://telas/cena_controles.tscn")
		
func botao_sair_jogo():
	get_tree().quit()
