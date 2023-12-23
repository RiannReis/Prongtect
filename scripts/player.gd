extends CharacterBody2D

@export var speed: int = 450
var health: int = 100


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()
	
	if Input.is_action_pressed("space_bar"):
		rotation += 360 * delta
		$AttackArea2D/CollisionShape2D.disabled = false
	
	if Input.is_action_just_released("space_bar"):
		rotation = 0
		$AttackArea2D/CollisionShape2D.disabled = true


func hit():
	health -= 20


func _on_attack_area_2d_body_entered(body):
	if $AttackArea2D/CollisionShape2D.disabled == false and body is FollowerEnemy and "hit" in body:
		body.hit()


