extends CharacterBody2D

class_name Ball


@export var speed: int = 300


func _ready():
	start_ball()


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())


func start_ball():
	randomize()
	velocity.x = [-speed, speed][randi() % 2]
	velocity.y = [-speed, speed][randi() % 2]

