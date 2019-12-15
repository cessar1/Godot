extends KinematicBody2D
onready var gold = preload("res://Scenes/Gold.tscn")
var health = 3

func _ready():
	pass

func take_damage(damage):
	if health > 0 and damage > 0:
		health -= damage
		if health <= 0:
			health = 0
			drop()
			
func die():
	queue_free()
	
func drop():
	var value = randi() % 4 + 1
	for i in range(value):
		var g = gold.instance()
		g.position.x = randi() % value * 50
		g.position.y = randi() % value * 35
		add_child(g)
		
	