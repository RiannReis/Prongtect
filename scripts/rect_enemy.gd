extends CharacterBody2D

@export var speed: int = 400

var rng = RandomNumberGenerator.new()

@onready var ball: Ball = $"../PongBall"


func _physics_process(_delta):
	velocity = Vector2(0, get_opponent_direction() * speed)
	move_and_slide()
	
	if position.x > 1100:
		replace_pos()


func get_opponent_direction() -> int:
	if abs(ball.position.y - position.y) > rng.randi_range(25, 40):
		if ball.position.y > position.y:
			return 1
		return -1
	return 0


func replace_pos():
	position.x = 1088
	position.y = 256
