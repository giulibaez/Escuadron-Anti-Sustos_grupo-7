extends CharacterBody2D

const VELOCIDAD= 200

func _physics_process(delta):
	movimiento()
	move_and_slide()


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
	
