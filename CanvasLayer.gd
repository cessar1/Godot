extends Node2D

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		pass

func _on_Area2D_mouse_entered():
	print("Adentro")
	if Input.action_press("mouse_button_1"):
		print ("Hola")
