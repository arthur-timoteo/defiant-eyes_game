extends KinematicBody2D

var movimentacao = Vector2.ZERO
var gravidade = 1200
var esta_ativado = false
export var y_sera_destruido = 0

func _ready():
	#Desativa a exacução da função _physics_process
	set_physics_process(false)

#Faz a plataforma cair
func _physics_process(delta):
	movimentacao.y += delta * gravidade
	position += movimentacao * delta
	
	destruir_plataforma()

func personagem_plataforma_cai(colisao: KinematicCollision2D, colisor: KinematicBody2D):
	if(!esta_ativado):
		esta_ativado = true
		$AnimationPlayer.play("desligada")
		movimentacao = Vector2.ZERO

#Ativa a execução da função _physics_process depois que a animação terminar
func _animacao_plataforma_terminou(anim_name):
	set_physics_process(true)

#Verifica se a plataforma atingiu a posição passada e a destroi
func destruir_plataforma():
	if(position.y >= y_sera_destruido):
		queue_free()
