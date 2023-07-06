extends Area2D

export var usavel : bool
export var atribuito : int
export var valor : int
export var nome : String

func _on_Coletavel_body_entered(body):
	if body.collision_layer == 1:
		atualizar_dados(body)
		queue_free()

func atualizar_dados(body):
	var item = {"nome": nome, "usavel": usavel, "atributo": atribuito, "valor": valor, "imagem": $Sprite.texture.load_path}
	body.recebe_item(item)
