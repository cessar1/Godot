extends StaticBody2D
var text = preload("res://Scenes/TextoFlotante.tscn")
var wood = 5
func _ready():
	$Colision.disabled

func take_damage(damage):
	
	$AnimationPlayer.play("mover")
	wood -= damage
	var t = text.instance()
	$Position2D.add_child(t)
	if  wood <= 0:
		destroy()

func destroy():
	$Colision.queue_free()
	$Copa.hide()
	


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()