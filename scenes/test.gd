extends Node2D

@onready var p0 = $BezierPoints/p0.position
@onready var p1 = $BezierPoints/p1.position
@onready var p2 = $BezierPoints/p2.position
@onready var l_sprite = $large
@onready var s_sprite = $small
@onready var line = $Line2D

var time : float = 0.0
var reverse : bool = false

func _ready():
	line.add_point(l_sprite.position)
	line.add_point(s_sprite.position)
	
func bezier(t:float):
	var q0 = p0.lerp(p1,t)
	var q1 = p1.lerp(p2,t)
	var r = q0.lerp(q1,t)
	return r
	
func _physics_process(delta):
	s_sprite.position = bezier(time)
	line.remove_point(1)
	line.add_point(s_sprite.position)
	
	if reverse:
		time -= delta
	else:
		time += delta
		
	if time >= 1:
		reverse = true
	if time <= 0:
		reverse = false
