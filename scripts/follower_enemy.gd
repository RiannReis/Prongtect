extends CharacterBody2D

class_name FollowerEnemy

@export var spot: PackedScene = null

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
	SignalBus.shake_soft.emit()
	$CPUParticles2D.emitting = true
	await get_tree().create_timer(0.5).timeout
	SignalBus.enemy_hit.emit()
	blow()
	queue_free()


func blow():
	if spot != null:
		var spot_added = spot.instantiate()
		get_tree().current_scene.add_child(spot_added)
		spot_added.global_position = self.global_position
	queue_free()
