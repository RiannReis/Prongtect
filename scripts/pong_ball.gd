extends CharacterBody2D

class_name Ball

@export var speed: int = 300


func _ready():
	start_ball()


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * speed * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())


func start_ball():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

