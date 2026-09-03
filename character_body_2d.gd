extends CharacterBody2D

const speed = 400
const jump_velocity= -400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var direction:= Input.get_axis("p1_left", "p1_right")
	
	if not is_on_floor():
		velocity.y += gravity*delta
		
	if Input.is_action_just_pressed("p1_jump") and is_on_floor():
		velocity.y = jump_velocity
	
	if direction:
		velocity.x= direction * speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()


func _on_ground_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
