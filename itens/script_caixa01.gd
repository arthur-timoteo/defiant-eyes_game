extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func personagem_pisou(body: Node) -> void:
	print(body.name)
	if(body.name == "AtaqueMarreta" || body.name == "Spinner"):
		queue_free()
	elif body.name == "Personagem":
		$AnimationPlayer.play("pisada")
		body.movimentacao.y -= 600
