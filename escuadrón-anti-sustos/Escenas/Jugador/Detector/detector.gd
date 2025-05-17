extends Area2D

signal deteccion

func _ready():
	$Radar/SpriteRadar.hide()

func _process(delta):
	if Input.is_action_pressed("Deteccion"):
		detectar()
	if Input.is_action_pressed("Interacción"):
		interactuar()
	if Input.is_action_pressed("Contencion"):
		contener()

func detectar():
	$Radar/SpriteRadar.show()
	$Timer.start()
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	$Radar/SpriteRadar.hide()

func interactuar():
	pass

func contener():
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	deteccion.emit()
