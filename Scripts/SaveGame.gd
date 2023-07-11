extends Node

const SAVE_PATH = "user://PackedSave.tscn"

func salvar_jogo():
	var cena = get_tree().get_current_scene()
	var pacote = PackedScene.new()
	
	pacote.pack(cena)
	ResourceSaver.save(SAVE_PATH, pacote)

func carregar_jogo():
	if ResourceLoader.exists(SAVE_PATH):
		#ResourceLoader.load(SAVE_PATH)
		get_tree().change_scene(SAVE_PATH)
	else:
		print("Erro ao carregar game")
