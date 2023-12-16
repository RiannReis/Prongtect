extends CharacterBody2D

@export var speed: int = 450



func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()
	
	if Input.is_action_pressed("space_bar"):
		rotation += 360 * delta
	
	if Input.is_action_just_released("space_bar"):
		rotation = 0
