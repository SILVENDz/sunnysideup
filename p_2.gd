extends CharacterBody2D

const speed = 400
const jump_velocity= -400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var direction:= Input.get_axis("p2_left", "p2_right")
	
	if not is_on_floor():
		velocity.y += gravity*delta
		
	if Input.is_action_just_pressed("p2_jump") and is_on_floor():
		velocity.y = jump_velocity
	
	if direction:
		velocity.x= direction * speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
