extends "res://Personagens/Personagem.gd"

var status
onready var player = get_node("/root").find_node("Jogador", true, false)

var destino
var opcoes

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		$AnimationPlayer.stop()
	else:
		$AnimationPlayer.play("andar" + frente) 


func _on_Visao_body_entered(body):
	if body.collision_layer == 1:
		status = 1
		$NavigationAgent2D.set_target_location(body.position)
		set_physics_process(true)


func _on_Visao_body_exited(body):
	if body.collision_layer == 1:
		status = 0
		$NavigationAgent2D.set_target_location(body.position)

func _on_AtaqueArea_body_entered(body):
	if body.collision_layer == 1:
		player = body
		set_physics_process(false)
		$AnimationPlayer.play("ataque" + frente)

func atacar():
	player.recebeu_ataque(dano, frente)
	$Timer.start(1)

func pos_ataque():
	$NavigationAgent2D.set_target_location(player.position)
	status = 1
	set_physics_process(false)
	$Timer.start(1)
