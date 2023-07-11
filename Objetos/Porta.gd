extends Node2D

export var pode_usar = false
export var player_position = Vector2.ZERO
export var opened = false

func _ready():
	volume_audio()

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		pode_usar = true
		player_position = body.global_position

func _on_Area2D_body_exited(body):
	if body.collision_layer == 1:
		pode_usar = false

func _input(event):
	if Input.is_action_just_pressed("interagir") and pode_usar and !opened:
		open_door()

func open_door():
	var door_direction = (player_position - global_position).normalized()

	if door_direction.x > 0:
		$Corpo/AnimationPlayer.play("horizontal")
	else:
		$Corpo/AnimationPlayer.play("horizontal_reversed")

	opened = true
	$Luz.enabled = true

func volume_audio():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("SFX")
