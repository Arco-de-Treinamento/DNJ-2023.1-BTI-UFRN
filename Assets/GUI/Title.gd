extends Control

func _ready():
	$AnimationPlayer.play("tela_inicial")
	volume_audio()

func _on_Start_pressed():
	get_tree().change_scene("res://Niveis/ScreenFase01.tscn")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Load_pressed():
	SaveGame.carregar_jogo()

func _on_Config_pressed():
	get_tree().change_scene("res://Assets/GUI/ConfigScreen.tscn")

func volume_audio():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("Musica")
