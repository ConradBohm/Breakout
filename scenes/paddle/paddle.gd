extends CharacterBody2D

const SPEED : float = 300.0

@onready var p0 : Vector2 = $Aimer/BezierPoints/p0.position
@onready var p1 : Vector2 = $Aimer/BezierPoints/p1.position
@onready var p2 : Vector2 = $Aimer/BezierPoints/p2.position
@onready var line : Line2D =  $Aimer/Line2D
@onready var aim_spot : Marker2D = $Aimer/AimSpot
@onready var sprite : Sprite2D = $Sprite2D

var time : float = 0.0
var reverse : bool = false

signal ball_fired(pos, direction)

func _ready():
	pass

func _physics_process(delta):
	player_control(delta)
	move_aimer(time)
	move_and_slide()
	
	line.clear_points()
	line.add_point(aim_spot.position)
	line.add_point(sprite.position)
	
	time_control(delta)
	
	
func bezier(t: float) -> Vector2:
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	
	var r = q0.lerp(q1, t)
	return r
	
func time_control(delta) -> void:
	if reverse:
		time -= delta
	else:
		time += delta
		
	if time >= 1:
		reverse = true
	if time <= 0:
		reverse = false
	
func move_aimer(time) -> void:
	aim_spot.position = bezier(time)
	
func player_control(delta) -> void:
	if Input.is_action_pressed("left"):
		velocity.x = -1 * (SPEED) * delta
		position += velocity
		
	if Input.is_action_pressed("right"):
		velocity.x = (SPEED) * delta
		position += velocity

	if Input.is_action_just_pressed("primary_action"):
		fire_ball()
		
func fire_ball():
	var direction = (global_position - aim_spot.global_position).normalized()
	$Aimer.visible = false
	ball_fired.emit(aim_spot.global_position, direction)


