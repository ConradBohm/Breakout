extends CharacterBody2D

const SPEED : float = 300.0

func _physics_process(delta):
	player_control(delta)
		
	move_and_slide()
	
	
func player_control(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -1 * (SPEED - 60.0) * delta
		position += velocity
		
	if Input.is_action_pressed("right"):
		velocity.x = (SPEED - 60.0) * delta
		position += velocity

	
