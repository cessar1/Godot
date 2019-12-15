extends KinematicBody2D
var gold = 0
var speed = 200
var playing = ""
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("Attack down")
			playing = "down"
	if Input.is_action_just_pressed("ui_up"):
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("Attack up")
			playing = "up"
	if Input.is_action_just_pressed("ui_right"):
		if not $AnimationPlayer.is_playing():	
			$AnimationPlayer.play("Attack right")
			playing = "right"
	if Input.is_action_just_pressed("ui_left"):
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("Attack left")
			playing = "left"
	
func _physics_process(delta):
	handle_movement()
	velocity = move_and_slide(velocity)
	
func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.stop()
func handle_movement():
	velocity = Vector2()
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed 
		

func _on_hitbox_body_entered(body):
	print(body.name)
	body.take_damage(1)


func _on_PlayerBox_area_entered(area):
	area.queue_free()
	gold += 1
