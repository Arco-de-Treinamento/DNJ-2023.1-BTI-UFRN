extends Control

func _ready():
	$AnimationPlayer.play("game_over")

func _on_Continue_pressed():
	get_tree().change_scene("res://Niveis/Fase_01.tscn")

func _on_Quit_pressed():
	get_tree().quit()
