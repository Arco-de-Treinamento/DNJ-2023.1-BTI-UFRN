extends CanvasLayer

onready var HUD = get_node("/root").find_node("HUD", true, false)
onready var Jogador = get_node("/root").find_node("Jogador", true, false)

func _input(event):
	if Input.is_action_just_pressed("Inventario"):
		if not $Popup.is_visible_in_tree():
			get_dados()
			get_tree().call_group("Mobile", "congelar")
			get_tree().call_group("Minimap", "esconder_mapa")
			$Popup.popup()
			$ColorRect.visible = true
			HUD.visible = false
		else:
			fechar_inventario()

func get_dados():
	$Popup/Ouro.text = "Ouro: " + str(Jogador.ouro)
	
	if Jogador.arma:
		$Popup/Arma/Sprite.texture = load(Jogador.arma.imagem)
		
	var objetos = $Popup/Items.get_children()
	
	limpar_imagens(objetos)
	
	var count = 0
	for i in Jogador.inventario:
		var imagem = objetos[count].get_children()
		imagem[0].texture = load(i.imagem)
		count += 1

func limpar_imagens(item):
	for i in item:
		var imagem = i.get_children()
		imagem[0].texture = null
	
func _on_Button_pressed():
	fechar_inventario()


func _on_Popup_popup_hide():
		fechar_inventario()

func fechar_inventario():
	get_tree().call_group("Mobile", "descongelar")
	get_tree().call_group("Minimap", "ver_mapa")
	$Popup.hide()
	$ColorRect.visible = false
	HUD.visible = true
