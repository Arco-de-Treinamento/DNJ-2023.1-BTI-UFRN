extends "res://Personagens/Personagem.gd"

export var HP_Max : int
var espada = false 

func _ready():
	speed = vel_normal

func _process(delta):
	atualiza_hud()

func atualiza_hud():
	get_tree().call_group("HUD", "atualiza_health", HP)

func _input(event):
	if Input.is_action_just_pressed("ataque") and espada:
		$AnimationPlayer.play("ataque" + frente)
		set_physics_process(false)

func definir_movimento():
	direcao.x = Input.get_axis("esqueda","direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		$AnimatedSprite.stop()
	else:
		if espada:
			$AnimatedSprite.play("espada" + frente) 
		else:
			$AnimatedSprite.play("andar" + frente) 

func morrer():
	get_tree().change_scene("res://Assets/GUI/GameOver.tscn")

func _on_AtaqueArea_body_entered(body):
	if body.collision_layer == 8:
		body.recebeu_ataque(dano, frente)


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
