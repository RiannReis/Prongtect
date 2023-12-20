extends CharacterBody2D

@export var speed: int = 200

@onready var player = $"../Player"

func _process(delta):
	var player_pos = player.position
	var direction = (player_pos - position).normalized()
	velocity = direction * speed
	look_at(player_pos)
	move_and_slide()
