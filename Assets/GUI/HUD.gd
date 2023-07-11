extends CanvasLayer

signal abrir_dialogo
signal avanca_dialogo
signal fecha_dialogo

var text_size = 0 

const MAX_TEXT = 250

func _ready():
	connect("abrir_dialogo", self, "mostrar_caixa")
	connect("avanca_dialogo", self, "avancar")
	connect("fecha_dialogo", self, "fechar_caixa")
	$Control/Dialogo/NinePatchRect/Continue.visible = false

func atualiza_dados(vida, potions, ouro):
	atualiza_vida(vida)
	atualiza_pocoes(potions)
	atualiza_ouro(ouro)

func atualiza_vida(valor):
	$Control/ProgressBar.value = valor
	
func atualiza_pocoes(valor):
	$Control/ItemList.set_item_text(0, "x" + str(valor));

func atualiza_ouro(valor):
	$Control/ItemList.set_item_text(1, "x" + str(valor));

func _input(event):
	if Input.is_action_just_pressed("interagir") and $Control/Dialogo.is_visible_in_tree():
		emit_signal("avanca_dialogo")

func mostrar_caixa(texto):
	get_tree().call_group("Mobile", "congelar")
	text_size = texto.length()
	$Control/Dialogo.popup()
	
	while (texto != ""):
		imprime_texto(texto.substr(0, MAX_TEXT))
		texto = texto.substr(MAX_TEXT, -1)
		text_size = texto.length()
		
		yield(self, "avanca_dialogo")
		

func imprime_texto(texto):
	$Control/Dialogo/NinePatchRect/Texto.visible_characters = 0
	$Control/Dialogo/NinePatchRect/Texto.text = texto
	
	var animacao = create_tween()
	
	for i in range(texto.length()):
		animacao.tween_property($Control/Dialogo/NinePatchRect/Texto, "visible_characters", i, 0.05)
	
	animacao.tween_property($Control/Dialogo/NinePatchRect/Continue, "visible", true, 0.01)

func avancar():
	if text_size == 0:
		emit_signal("fecha_dialogo")

func fechar_caixa():
	$Control/Dialogo/NinePatchRect/Texto.text = ""
	$Control/Dialogo.hide()
	get_tree().call_group("Mobile", "descongelar")

func pausar_jogo():
	get_tree().call_group("Mobile", "congelar")
	$Control/PauseScreen/Popup.popup()
