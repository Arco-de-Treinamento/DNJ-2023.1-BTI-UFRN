extends Control

func _ready():
	$Minimap/Viewport.world_2d = $Principal/Viewport.world_2d

func _process(delta):
	$Minimap/Viewport/Camera2D.position = $Principal/Viewport/Sandbox/Jogador.position
