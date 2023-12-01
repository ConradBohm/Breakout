extends Node2D

var paddle_scene : PackedScene = preload("res://scenes/paddle/paddle.tscn")
var ball_scene : PackedScene = preload("res://scenes/ball/ball.tscn")
var master_paddle

# Called when the node enters the scene tree for the first time.
func _ready():
	var paddle = paddle_scene.instantiate() as CharacterBody2D
	paddle.connect("ball_fired", _on_paddle_ball_fired)
	paddle.position = $Units/PaddleSpawn.position
	paddle.rotation = -PI/2
	$Units.add_child(paddle)
	master_paddle = paddle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_paddle_ball_fired(paddle_position, direction):
	var ball = ball_scene.instantiate() as RigidBody2D
	ball.position = paddle_position
	ball.linear_velocity = direction * -ball.speed
	$Units.add_child(ball)


func _on_dead_zone_body_entered(_body):
	# reduce life by 1
	await get_tree().create_timer(1).timeout
	master_paddle.enable_aimer()
