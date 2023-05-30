extends "res://Objetos/Coletavel.gd"

export var dano = 3

func atualizar_dados(body):
	body.dano = dano
	body.espada = true
