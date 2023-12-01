extends RigidBody2D

@onready var collision_sound : AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var speed : float = 900.0

func _ready():
	pass

func _process(_delta):
	pass

func _on_body_exited(_body):
	collision_sound.play(global_position.x)
