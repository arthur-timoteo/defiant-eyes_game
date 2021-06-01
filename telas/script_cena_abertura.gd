extends CanvasLayer

var contador = 1

func _ready():
	$AudioStreamPlayer.volume_db = -20
	$AudioStreamPlayer.play()

func _process(delta):
	if(Input.is_action_just_pressed("ui_confirm")):
		if(contador == 1):
			contador += 1
			$AnimationPlayer.play("animacao2")
			$Control/Animacao1.visible = false
		elif(contador == 2):
			get_tree().change_scene("res://telas/cena_inicial.tscn")

func _animacao_terminou(anim_name):
	if(anim_name == "animacao1"):
		contador += 1
		yield(get_tree().create_timer(1), "timeout")
		$AnimationPlayer.play("animacao2")
		
	if(anim_name == "animacao2"):
		get_tree().change_scene("res://telas/cena_inicial.tscn")
