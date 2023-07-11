extends Control

func _on_continuar_pressed():
	get_tree().call_group("Mobile", "descongelar")
	$Popup.hide()

func _on_salvar_pressed():
	SaveGame.salvar_jogo()

func _on_carregar_pressed():
	SaveGame.carregar_jogo()

func _on_voltar_pressed():
	get_tree().change_scene("res://Assets/GUI/Title.tscn")
