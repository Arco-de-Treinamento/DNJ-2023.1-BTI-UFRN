extends Area2D

export var texto : String
onready var HUD = get_node("/root").find_node("HUD", true, false)

func _on_Mensagem_body_entered(body):
	if body.collision_layer == 1:
		mostrar_dialogo()
		queue_free()

func mostrar_dialogo():
	HUD.emit_signal("abrir_dialogo", texto)
	get_tree().call_group("Mobile", "congelar")
