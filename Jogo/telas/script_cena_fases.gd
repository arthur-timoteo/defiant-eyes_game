extends Node2D

var faseSelecionada = 0

func _ready():	
	faseSelecionada = ScriptGlobal.faseMaxima
	exibir_progressao()
	$AudioStreamPlayer.volume_db = ScriptGlobal.sonsVolume
	print(ScriptGlobal.faseAtual)
	print(ScriptGlobal.faseMaxima)

func _process(_delta):
	if(faseSelecionada == 1 && Input.is_action_just_pressed("ui_right") && ScriptGlobal.faseMaxima > 1):
		faseSelecionada += 1	
		$AudioStreamPlayer.play()	
	
	elif(faseSelecionada == 2 && Input.is_action_just_pressed("ui_right") && ScriptGlobal.faseMaxima > 2):
		faseSelecionada += 1
		$AudioStreamPlayer.play()
	elif(faseSelecionada == 2 && Input.is_action_just_pressed("ui_left")):
		faseSelecionada -= 1
		$AudioStreamPlayer.play()
	
	elif(faseSelecionada == 3 && Input.is_action_just_pressed("ui_left")):
		faseSelecionada -= 1
		$AudioStreamPlayer.play()
	
	altera_sprite_fase()
	
	if(Input.is_action_just_pressed("ui_confirm")):
		direciona_fase()

func exibir_progressao():
	if(ScriptGlobal.faseMaxima == 1):
		$Fase01.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseMaxima > 1):
		$Fase01.region_rect = Rect2(1, 1, 51, 25)
		
	if(ScriptGlobal.faseMaxima == 2):
		$Fase02.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseMaxima > 2):
		$Fase02.region_rect = Rect2(1, 1, 51, 25)
	else:
		$Fase02.region_rect = Rect2(107, 1, 51, 25)
		
	if(ScriptGlobal.faseMaxima == 3):
		$Fase03.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseMaxima > 3):
		$Fase03.region_rect = Rect2(1, 1, 51, 25)
	else:
		$Fase03.region_rect = Rect2(107, 1, 51, 25)

func altera_sprite_fase():
	if(faseSelecionada == 1):
		$Fase01.region_rect = Rect2(54, 1, 51, 25)
	else:
		$Fase01.region_rect = Rect2(1, 1, 51, 25)
		
	if(faseSelecionada == 2):
		$Fase02.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseMaxima < 2):
		$Fase02.region_rect = Rect2(107, 1, 51, 25)
	else:
		$Fase02.region_rect = Rect2(1, 1, 51, 25)
		
	if(faseSelecionada == 3):
		$Fase03.region_rect = Rect2(54, 1, 51, 25)
	elif(ScriptGlobal.faseMaxima < 3):
		$Fase03.region_rect = Rect2(107, 1, 51, 25)
	else:
		$Fase03.region_rect = Rect2(1, 1, 51, 25)

func direciona_fase():
	if(faseSelecionada == 1):
		ScriptGlobal.faseAtual = 1
		ScriptGlobal.QuantidadeVida = 3
		ScriptGlobal.TempoDaFase = 120
		get_tree().change_scene("res://fases/cena_fase01.tscn")
	elif(faseSelecionada == 2):
		ScriptGlobal.faseAtual = 2
		ScriptGlobal.QuantidadeVida = 3
		ScriptGlobal.TempoDaFase = 120
		get_tree().change_scene("res://fases/cena_fase02.tscn")
	elif(faseSelecionada == 3):
		ScriptGlobal.faseAtual = 3
		ScriptGlobal.QuantidadeVida = 3
		ScriptGlobal.TempoDaFase = 150
		get_tree().change_scene("res://fases/cena_fase03.tscn")


func _voltar_ao_menu():
	get_tree().change_scene("res://telas/cena_autenticado.tscn")
