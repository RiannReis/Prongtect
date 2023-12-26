extends Camera2D

@export var random_strength: float = 10.0
@export var shake_fade: float = 8.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0
var screen_shake_start: bool = false


func _ready():
	SignalBus.connect("shake_soft", apply_shake_soft)
	SignalBus.connect("shake_medium", apply_shake_medium)


func apply_shake_soft():
	$ShakeTimer.start()
	screen_shake_start = true
	shake_strength = random_strength


func apply_shake_medium():
	$ShakeTimer.start()
	screen_shake_start = true
	shake_strength = random_strength + 20.0


func _process(delta):
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, (shake_fade - 3.0) * delta)
		
		offset = random_offset()
	

func random_offset():
	return Vector2(rng.randf_range(-shake_strength, shake_strength),rng.randf_range(-shake_strength, shake_strength))
	
	
func _on_shake_timer_timeout():
	screen_shake_start = false
