extends "res://Personagens/Inimigo.gd"

export var frente_inicial : String

func _ready():
	status = 0
	$AnimationPlayer.play("andar_" + frente_inicial)
	opcoes = $Locais.get_children()
	destino = opcoes[0]

	set_physics_process(false)

func definir_movimento():
	if $NavigationAgent2D.is_navigation_finished():
		if abs(position.x - destino.position.x) > 1 or abs(position.y - destino.position.y) > 1:
			$NavigationAgent2D.set_target_location(destino.position)
			status = 0
		else:
			$AnimationPlayer.play("andar_" + frente_inicial)
			yield(get_tree().create_timer(0.5), "timeout")
			set_physics_process(false)
	else:
		caminhar()
		print(HP)

func caminhar():
	var alvo = $NavigationAgent2D.get_next_location()
	
	direcao = position.direction_to(alvo)
	
	definir_direcao()
	
	if is_on_wall():
		$NavigationAgent2D.set_target_location(destino.position)

func _on_Timer_timeout():
	set_physics_process(true)
