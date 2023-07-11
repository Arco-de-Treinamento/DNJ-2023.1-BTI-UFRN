extends KinematicBody2D

export var speed : int
export var vel_normal : int
export var vel_corrida : int
export var HP : int 
export var atkVal : int
export var knockback : int

var direcao = Vector2(0,0)
export var frente : String

func _ready():
	volume_audio()

func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	move_and_slide(direcao * speed)

func recebeu_ataque(atkVal, dir):
	HP -= atkVal
	
	if HP <= 0:
		$AnimationPlayer.play("morrer")
		set_physics_process(false)
	
	empurrar_tras(dir)
	pos_ataque()

func empurrar_tras(dir):
	$AudioStreamPlayer.stream = load("res://Assets/SFX/Socapex - new_hits_2.wav")
	$AudioStreamPlayer.play()
	
	var nova_posicao = position
	
	if dir == "_cima":
		nova_posicao.y -= knockback
	elif dir == "_baixo":
		nova_posicao.y += knockback
	elif dir == "_direita":
		nova_posicao.x += knockback
	else:
		nova_posicao.x -= knockback
	
	var notion = nova_posicao - position
	move_and_slide(notion * knockback) 

func definir_movimento():
	pass 

func definir_animacao():
	pass

func pos_ataque():
	pass

func definir_direcao():
	if direcao.x > 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_direita"
	elif direcao.x < 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_esquerda"
	elif direcao.y > 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_baixo"
	elif direcao.y < 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_cima"

func congelar():
	set_physics_process(false)

func descongelar():
	set_physics_process(true)

func volume_audio():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("SFX")
