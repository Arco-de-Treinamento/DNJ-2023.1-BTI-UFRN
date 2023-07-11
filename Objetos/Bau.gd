extends StaticBody2D

var can_open = false
export var first_open = true
export var loots = {}
var Jogador

export var random : bool

func _ready():
	volume_audio()
	
	if random == true:
		carregar_loots()
		randomize()
		var tesouro = load(loots[randi() % loots.size()]).instance()
		
		tesouro.visible = false
		tesouro.position = position
		$Tesouro.add_child(tesouro)

func carregar_loots():
	var count = 0
	var dir = Directory.new()
	
	dir.open("res://Objetos/Loot/")
	dir.list_dir_begin(true)
	
	var file = dir.get_next()
	
	while file != "":
		if file.ends_with(".tscn"):
			loots[count] = "res://Objetos/Loot/" + file
			count += 1
		
		file = dir.get_next()

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		can_open = true
		Jogador = body


func _on_Area2D_body_exited(body):
	if body.collision_layer == 1:
		can_open = false

func _input(event):
	if Input.is_action_just_pressed("interagir") and can_open and first_open:
		$AnimationPlayer.play("abrir")
		first_open = false

func mostrar_loot():
	var tesouro = $Tesouro.get_children()
	tesouro[0].visible = true
	#print(tesouro[0])
	
	var animacao = create_tween()
	var nova_posicao = position
	nova_posicao.y -= 80
	
	animacao.tween_property(tesouro[0], "position", nova_posicao, 1)
	animacao.tween_callback(tesouro[0], "adiciona_loot", [Jogador])

func volume_audio():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("SFX")
