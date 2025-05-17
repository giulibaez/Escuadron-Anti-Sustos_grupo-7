extends Node2D

var detector = preload("res://Escenas/Jugador/Detector/detector.tscn")

func ready():
	add_child(detector)
