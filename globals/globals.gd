extends Node

var health: int = 100:
	set(value):
		if health == value:
			return
		health = value
		SignalBus.update_health_changed.emit(health)

var score: int
