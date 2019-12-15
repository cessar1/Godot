extends KinematicBody2D
var max_gold
var min_gold
var gold
func _ready():
	pass
func set_gold_amout(level):
	max_gold = round(pow(level,0.74) + 4 * level)
	min_gold = 1
	gold = randi() % max_gold + min_gold
