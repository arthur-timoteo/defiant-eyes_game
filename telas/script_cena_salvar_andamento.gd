extends CanvasLayer

func _ready():
	yield(get_tree().create_timer(5), "timeout")
	assert(get_tree().change_scene(ScriptGlobal.caminhoDirecionarDepoisDeSalvarAndamento) == OK)
