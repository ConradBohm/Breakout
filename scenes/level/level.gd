extends Node2D

var paddle_scene : PackedScene = preload("res://scenes/paddle/paddle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var paddle = paddle_scene.instantiate() as CharacterBody2D
	paddle.position = Vector2(800,500) 
	paddle.rotation_degrees = -90
	add_child(paddle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
