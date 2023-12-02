extends Node2D

var paddle_scene : PackedScene = preload("res://scenes/paddle/paddle.tscn")
var ball_scene : PackedScene = preload("res://scenes/ball/ball.tscn")
var master_paddle
var life_count : int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.load_score()
	Globals.connect("update_score", _on_update_score)
	_on_update_score()
	load_paddle()
	$UI.adjust_health(life_count)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func load_paddle():
	var paddle = paddle_scene.instantiate() as CharacterBody2D
	paddle.connect("ball_fired", _on_paddle_ball_fired)
	paddle.position = $Units/PaddleSpawn.position
	paddle.rotation = -PI/2
	$Units.add_child(paddle)
	master_paddle = paddle

func _on_paddle_ball_fired(paddle_position, direction):
	var ball = ball_scene.instantiate() as RigidBody2D
	ball.position = paddle_position
	ball.linear_velocity = direction * -ball.speed
	$Units.add_child(ball)


func _on_dead_zone_body_entered(_body):
	life_count -= 1
	$UI.adjust_health(life_count)
	if life_count <= 0:
		stop_game()
		return
		
	await get_tree().create_timer(1).timeout
	master_paddle.enable_aimer()
	
func _on_update_score():
	$UI/Score.text = str(Globals.score)
	$UI/Highscore.text = str("\nHigh: %s " % Globals.high_score)
	
func stop_game():
	if Globals.score > Globals.high_score:
		Globals.high_score = Globals.score
		$UI.highscore()
		await get_tree().create_timer(3).timeout
		
	$UI.final_score()
	await get_tree().create_timer(6).timeout
	Globals.save_score()
	get_tree().quit()
