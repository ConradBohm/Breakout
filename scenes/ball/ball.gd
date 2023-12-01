extends RigidBody2D

@onready var collision_sound : AudioStreamPlayer2D = $CollisionSound
@export var speed : float = 1000.0

func _process(_delta):
	pass

func _on_body_exited(_body):
	collision_sound.play(global_position.x)
