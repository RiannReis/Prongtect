extends CharacterBody2D

class_name FollowerEnemy

@export var speed: int = 200
var health: int = 10

@onready var player = $"../Player"


func _process(_delta):
	var player_pos = player.global_position
	var direction = (player_pos - position).normalized()
	velocity = direction * speed
	look_at(player_pos)
	move_and_slide()


func hit():
	health -= 10
	await get_tree().create_timer(0.5).timeout
	SignalBus.enemy_hit.emit()
	queue_free()
