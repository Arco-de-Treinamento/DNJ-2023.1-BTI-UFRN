extends Area2D

export var dano : int

func _ready():
	volume_audio()

func volume_audio():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("SFX")
