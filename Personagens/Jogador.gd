extends "res://Personagens/Personagem.gd"

export var HP_Max : int
export var dano : int
export var arma = false 
export var potion = 0
export var ouro = 0
export var inventario = []

func _ready():
	speed = vel_normal

func _process(delta):
	atualiza_hud()

func atualiza_hud():
	get_tree().call_group("HUD", "atualiza_dados", HP, potion, ouro)

func _input(event):
	if Input.is_action_just_pressed("ataque") and arma:
		$AnimationPlayer.play("ataque" + frente)
		set_physics_process(false)
		
	elif (Input.is_action_just_pressed("item") and potion > 0):
		HP += 3
		
		if HP > HP_Max:
			HP = HP_Max
		
		potion -= 1
		
		if potion == 0:
			for i in inventario:
				if i.nome == "porcaoHP":
					inventario.erase(i)
	
	elif Input.is_action_just_pressed("pausar"):
		var HUD = get_tree().get_root().find_node("HUD", true, false)
		
		HUD.pausar_jogo()

func recebe_item(item):
	if inventario.size() <= 15:
		if item.usavel:
			if item.nome == "porcaoHP":
				potion += 1
				var achou = false
				
				for i in inventario:
					if item.nome == i.nome:
						achou = true
				
				if not achou:
					inventario.append(item)
			else:
				inventario.append(item)

		else:
			print(atkVal)
			atkVal = item.atributo
			arma = item
			print(atkVal)

func definir_movimento():
	direcao.x = Input.get_axis("esqueda","direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		$AnimatedSprite.stop()
	else:
		if arma:
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
