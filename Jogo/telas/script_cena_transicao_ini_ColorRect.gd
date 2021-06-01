extends ColorRect

var progresso = 0.0

func _process(_delta):
	material.set("shader_param/progress", progresso)
