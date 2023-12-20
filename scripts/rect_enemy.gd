extends CharacterBody2D

@export var speed: int = 400

@onready var ball: Ball = $"../PongBall"


func _physics_process(_delta):
	velocity = Vector2(0, get_opponent_direction() * speed)
	move_and_slide()


func get_opponent_direction() -> int:
	if abs(ball.position.y - position.y) > 12:
		if ball.position.y > position.y:
			return 1
		return -1
	return 0
