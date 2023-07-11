extends Control

func _ready():
	$Minimap/Viewport.world_2d = $Principal/Viewport.world_2d

func _process(delta):
	$Minimap/Viewport/Camera2D.position = $Principal/Viewport/Fase_01/Jogador.position

func ver_mapa():
	$NinePatchRect.visible = true
	$Minimap.visible = true

func esconder_mapa():
	$NinePatchRect.visible = false
	$Minimap.visible = false

