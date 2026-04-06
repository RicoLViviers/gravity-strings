extends CharacterBody2D


const SPEED = 100000.0


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed('move_down'):
		velocity.y += SPEED * delta
	if Input.is_action_just_pressed('move_up'):
		velocity.y -= SPEED * delta
	if Input.is_action_just_pressed('move_right'):
		velocity.x += SPEED * delta
	if Input.is_action_just_pressed('move_left'):
		velocity.x -= SPEED * delta
		
	move_and_slide()
