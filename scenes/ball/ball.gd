extends RigidBody2D

@onready var collision_sound : AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var speed : float = 900.0

func _ready():
	pass

func _process(_delta):
	pass


func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit()
