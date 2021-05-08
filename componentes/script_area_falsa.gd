extends Area2D

func _personagem_caiu(body):
	if(body.name == "Personagem"):
		get_tree().reload_current_scene()
