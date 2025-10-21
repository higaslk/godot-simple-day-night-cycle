class_name AmbientLight
extends CanvasModulate

@export var enabled: bool = false
@export var gradient_texture: GradientTexture1D

var starting_hour = TimeManager.starting_hour

func _process(_delta: float) -> void:
	if not enabled: return
	var current_time = TimeManager.get_hour_time()

	var time_angle = (current_time * PI / 12.0) - (PI / 2.0)
	var gradient_pos = sin(time_angle) * 0.5 + 0.5

	color = gradient_texture.gradient.sample(gradient_pos)