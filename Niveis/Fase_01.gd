extends Node2D

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		tocar_cutscene_final(body)

func tocar_cutscene_final(body):
	$CenaFInal.position = body.position
	$CenaFInal.current = true
	body.visible = false
	
	var nova_posicao = $Objetivos/Navio.position
	nova_posicao.x += 800
	
	var animacao = create_tween()
	animacao.tween_property($Objetivos/Navio, "rotation_degrees", -90.0, 1)
	animacao.tween_property($Objetivos/Navio, "position", nova_posicao, 7)
	animacao.tween_callback(get_tree(), "change_scene", ["res://Assets/GUI/Title.tscn"])
