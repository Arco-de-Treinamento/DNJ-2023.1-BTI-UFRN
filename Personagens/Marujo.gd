extends "res://Personagens/Inimigo.gd"

func _ready():
	status = 0
	randomize()
	opcoes = $Locais.get_children()
	escolha_destino()


func escolha_destino():
	if opcoes.size() > 0:
		if status == 0: 
			destino = opcoes[randi() % opcoes.size()]
		elif status == 1:
			destino = player
		
		$NavigationAgent2D.set_target_location(destino.position)

func definir_movimento():
	if $NavigationAgent2D.is_navigation_finished() and status == 0:
		if $Timer.is_stopped():
			$Timer.start()
			set_physics_process(false)
	else:
		caminhar()

func caminhar():
	var alvo = $NavigationAgent2D.get_next_location()
	
	direcao = position.direction_to(alvo)
	
	definir_direcao()
	
	if is_on_wall():
		escolha_destino()


func _on_Timer_timeout():
	escolha_destino()
	set_physics_process(true)


