extends CharacterBody2D

const VELOCIDAD= 200

signal deteccion

func _ready():
	$Radar/RadarSprite2D.hide()
	

func _physics_process(delta):
	movimiento()
	move_and_slide()
	if Input.is_action_pressed("Deteccion"):
		detectar()
	if Input.is_action_pressed("Interacción"):
		interactuar()
	if Input.is_action_pressed("Contencion"):
		contener()

func movimiento():
	var vel_x := 0.0
	var  vel_y := 0.0
	# Movimiento horizontal
	if Input.is_action_pressed("derecha"):
		vel_x += 1
	elif Input.is_action_pressed("izquierda"):
		vel_x -= 1
	 # Movimiento vertical
	if Input.is_action_pressed("abajo"):
		vel_y += 1
	elif Input.is_action_pressed("arriba"):
		vel_y -= 1
	
	if vel_x != 0 and vel_y != 0:
		vel_x *= 0.7071
		vel_y *= 0.7071
		
	velocity.x = vel_x * VELOCIDAD
	velocity.y = vel_y * VELOCIDAD

func detectar():
	$Radar/RadarSprite2D.show()
	$Timer.start()
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	$Radar/RadarSprite2D.hide()
	hidden.emit()

func interactuar():
	pass

func contener():
	pass

func _on_radar_body_entered(body: Node2D) -> void:
	if $Radar/RadarSprite2D.visible:
		deteccion.emit()
