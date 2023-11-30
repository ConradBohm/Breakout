extends CharacterBody2D

const SPEED : float = 300.0

@onready var p0 : Vector2 = $Aimer/BezierPoints/p0.global_position
@onready var p1 : Vector2 = $Aimer/BezierPoints/p1.global_position
@onready var p2 : Vector2 = $Aimer/BezierPoints/p2.global_position

var time : float = 0.0
var reverse : bool = false

signal ball_fired(direction)

func _ready():
	$Aimer/Line2D.add_point(global_position)
	$Aimer/Line2D.add_point($Aimer/AimSpot.global_position)

func _physics_process(delta):
	time += delta
	
	player_control(delta)
	#move_aimer(delta)
		
	move_and_slide()
	
func bezier(t: float) -> Vector2:
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	
	var r = q0.lerp(q1, t)
	return r
	
func move_aimer(delta) -> void:
	$Aimer/AimSpot.position = bezier(time)
	
func player_control(delta) -> void:
	if Input.is_action_pressed("left"):
		velocity.x = -1 * (SPEED - 60.0) * delta
		position += velocity
		
	if Input.is_action_pressed("right"):
		velocity.x = (SPEED - 60.0) * delta
		position += velocity

func fire_ball(aim_position):
	pass
