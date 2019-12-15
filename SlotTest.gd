extends Node2D
var can_drag = false
func _ready():
	pass
func _process(delta):
	if can_drag:
		global_position = get_global_mouse_position()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("button_left"):
		can_drag = true
		
	if Input.is_action_just_released("button_left"):
		can_drag = false
