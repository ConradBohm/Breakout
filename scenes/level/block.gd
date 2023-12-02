extends RigidBody2D

var red : Color = Color("fd1530")
var orange : Color = Color("ff3804")
var yellow : Color = Color("ffdf26")
var green : Color = Color("00c142")
var blue : Color = Color("00a3ff")
var purple : Color = Color("cd35dc")
var pink : Color = Color("f300ad")
# var gold : Color = Color("dca015")

var colour_list : Array = [red,orange,yellow,green,blue,purple,pink]
var value : int = 25

@onready var sprite : Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.modulate = colour_list[randi() % colour_list.size()]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func hit():
	Globals.score += value
	queue_free()
