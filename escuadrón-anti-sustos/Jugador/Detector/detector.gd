extends Area2D

var radar = preload("res://radar.gd")

signal objeto
signal deteccion

var velocity : int = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$Area2D/SpriteRadar.hide()

func _process(delta):
	if Input.is_action_pressed("Deteccion"):
		detectar()
	if Input.is_action_pressed("Interacción"):
		interactuar()
	if Input.is_action_pressed("Contencion"):
		contener()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func detectar():
	add_child(radar)
	deteccion.emit()
	$Area2D/SpriteRadar.show()
	$Timer.start()
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	remove_child(radar)
	$Area2D/SpriteRadar.hide()

func interactuar():
	pass

func contener():
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	deteccion.emit()
