extends Node2D

var velocidade_spinner = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	velocidade_spinner = ScriptGlobal.spinner_mov


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocidade_spinner)
