extends Area2D

func _on_Coletavel_body_entered(body):
	if body.collision_layer == 1:
		atualizar_dados(body)
		queue_free()

func atualizar_dados(body):
	pass
