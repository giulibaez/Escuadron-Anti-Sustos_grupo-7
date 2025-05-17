extends Area2D

var radar = preload("res://radar.gd")

signal objeto
signal deteccion

var velocity : int = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 100
	if Input.is_action_pressed("move_left"):
		velocity.x -= 100
	if Input.is_action_pressed("move_down"):
		velocity.y += 100
	if Input.is_action_pressed("move_up"):
		velocity.y -= 100

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
	$Timer.start()
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	remove_child(radar)

func interactuar():
	pass

func contener():
	pass
