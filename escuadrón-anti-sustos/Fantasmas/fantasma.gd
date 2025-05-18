extends RigidBody2D

func _ready():
	$Sprite2D.hide()

func _on_detector_deteccion() -> void:
	$Sprite2D.show()

func _on_detector_hidden() -> void:
	$Sprite2D.hide()
