extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ScriptGlobal.QuantidadeVida = 3
	ScriptGlobal.QuantidadePontos = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func limpar_objeto(area):
	if(area.name == "spinner"):
		area.queue_free()
