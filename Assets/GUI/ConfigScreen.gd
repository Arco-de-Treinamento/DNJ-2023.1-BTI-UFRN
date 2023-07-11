extends Control

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/SFX/HBoxContainer/SFXSlider.value = Config.pegar_volume("SFX")
	$MarginContainer/VBoxContainer/VBoxContainer/Music/HBoxContainer/MusicSlider.value = Config.pegar_volume("Musica")

func _on_SFXSlider_value_changed(value):
	Config.setar_volume("SFX", value)

func _on_MusicSlider_value_changed(value):
	Config.setar_volume("Musica", value)

func _on_Button_pressed():
	Config.config.save(Config.CONFIG_PATH)
	
	get_tree().change_scene("res://Assets/GUI/Title.tscn")
