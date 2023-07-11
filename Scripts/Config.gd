extends Node

const CONFIG_PATH = "user://Configuration.cfg"
var config = ConfigFile.new()

func _ready():
	var erro = config.load(CONFIG_PATH)
	
	if erro != OK:
		config.set_value("Dados", "SFX", -20)
		config.set_value("Dados", "Musica", -20)
		config.save(CONFIG_PATH)
	
func pegar_volume(tipo):
	if tipo == "SFX":
		return config.get_value("Dados", "SFX")
	else:
		return config.get_value("Dados", "Musica")

func setar_volume(tipo, valor):
	if tipo == "SFX":
		config.set_value("Dados", tipo, valor)
	else:
		config.set_value("Dados", tipo, valor)
