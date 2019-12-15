extends ColorRect
var last_position = null
var drag_position = null
signal is_moving
func _ready():
	get_parent().connect("last_position_changed", self, "on_last_position_changed")


func _on_Icon_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			drag_position = get_global_mouse_position() - rect_global_position
		else:
			drag_position = null
			if last_position:
				rect_global_position = last_position
	if event is InputEventMouseMotion and drag_position:
		emit_signal("is_moving")
		rect_global_position = get_global_mouse_position() - drag_position
		
func on_last_position_changed(new_position):
	last_position = new_position
	print("position updated...")