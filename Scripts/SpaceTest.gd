extends Area2D

const TURN_SPEED =  180

const MOVE_SPEED = 300
const ACC = 0.05
const DEC = 0.001

var screen_size
var screen_buffer = 8

var motion = Vector2(0,0)

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= TURN_SPEED * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += TURN_SPEED * delta
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_pressed("ui_up"):
		motion = motion.linear_interpolate(movedir, ACC)
	else: 
		motion = motion.linear_interpolate(Vector2(0,0), DEC)
		
	position += motion * MOVE_SPEED * delta
	
	position.x = wrapf(position.x, -screen_buffer, screen_size.x + screen_buffer)
	position.y = wrapf(position.y, -screen_buffer, screen_size.y + screen_buffer)