extends KinematicBody2D

const ceu = Vector2(0, -1)
const gravidade = 1200
const velocidade = 500
#const pulo_altura = -550
const pulo_altura = -750
var movimentacao = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.limit_bottom = 1280
	$Camera2D.limit_right = 16512
	pass # Replace with function body.

func _physics_process(delta):
	movimentacao.y += gravidade * delta
	
	if Input.is_action_pressed("ui_right"):
		movimentacao.x = velocidade
		$AnimationPlayer.play("andando")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		movimentacao.x = -velocidade
		$AnimationPlayer.play("andando")
		$Sprite.flip_h = true
	else:
		movimentacao.x = 0
		$AnimationPlayer.play("parado")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			movimentacao.y = pulo_altura
			$AudioStreamPlayer.play()
	else:
		$AnimationPlayer.play("pulando")
		
	movimentacao = move_and_slide(movimentacao, ceu)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
