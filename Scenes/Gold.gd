extends Area2D

func _ready():
	pass
func _physics_process(delta):
	var bodies = get_overlapping_areas()
	for body in bodies:
		if body.name == "MagnetBox":
			position += (body.get_parent().global_position - global_position) / 10 
	


func _on_Timer_timeout():
	queue_free()
