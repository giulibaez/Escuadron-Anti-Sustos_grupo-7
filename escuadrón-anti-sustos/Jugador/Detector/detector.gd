extends Node2D

signal objeto
signal deteccion

var velocity : int = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$Area2D/SpriteRadar.hide()

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
	$Area2D/SpriteRadar.show()
	$Timer.start()
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	$Area2D/SpriteRadar.hide()

func interactuar():
	pass

func contener():
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	deteccion.emit()
