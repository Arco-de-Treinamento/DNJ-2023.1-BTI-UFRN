extends "res://Objetos/Armadilhas.gd"

var jogador

func _on_ESpinhos_body_entered(body):
	if body.collision_layer == 1:
		$AnimatedSprite.play("ativar")
		jogador = body
		
		yield(get_tree().create_timer(0.2), "timeout")
		atacar()

func atacar():
	var sentido = definir_lado(jogador.frente)
	jogador.recebeu_ataque(dano, sentido)

func definir_lado(frente):
	if frente == "_cima":
		return "_baixo"
	elif frente == "_baixo":
		return "_cima"
	elif frente == "_esquerda":
		return "_direita"
	else:
		return "_esquerda"
