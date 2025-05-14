extends Node2D

var velocity = 400
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
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
