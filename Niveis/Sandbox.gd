extends Node2D

func _ready():
	volume_audio()
	$HUD.emit_signal("abrir_dialogo", "Mussum Ipsum, cacilds vidis litro abertis. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget.Manduma pindureta quium dia nois paga.A ordem dos tratores não altera o pão duris.Per aumento de cachacis, eu reclamis. Mussum Ipsum, cacilds vidis litro abertis. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget.Manduma pindureta quium dia nois paga.A ordem dos tratores não altera o pão duris.Per aumento de cachacis, eu reclamis.")

func volume_audio():
	var sons = $Sons.get_children()
	
	for i in sons:
		i.volume_db = Config.pegar_volume("Musica")
