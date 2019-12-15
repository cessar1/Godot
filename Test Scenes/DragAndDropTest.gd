extends Control
onready var icon = get_node("Icon")
onready var slots = get_node("Slots")

var last_position = null
signal last_position_changed(new_position)
func _ready():
	emit_signal("last_position_changed",last_position)
	icon.connect("is_moving",self, "on_icon_is_moving")

func on_icon_is_moving():
	update_icon_position()
	
func update_icon_position():
	for i in slots.get_children():
		if i.get_global_rect().intersects(icon.get_global_rect()):
			last_position = i.rect_global_position + icon.rect_size / 4
			emit_signal("last_position_changed",last_position)