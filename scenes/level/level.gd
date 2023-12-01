extends Node2D

var paddle_scene : PackedScene = preload("res://scenes/paddle/paddle.tscn")
var ball_scene : PackedScene = preload("res://scenes/ball/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var paddle = paddle_scene.instantiate() as CharacterBody2D
	paddle.connect("ball_fired", _on_paddle_ball_fired)
	paddle.position = Vector2(800,500) 
	paddle.rotation_degrees = -90
	add_child(paddle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_paddle_ball_fired(paddle_position, direction):
	var ball = ball_scene.instantiate() as RigidBody2D
	ball.position = paddle_position
	ball.rotation = PI
	ball.linear_velocity = direction * -ball.speed
	add_child(ball)
