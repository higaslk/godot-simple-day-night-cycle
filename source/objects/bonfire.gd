extends Node2D

@onready var light = $Fire_light

var default_energy: float

func _ready():
	default_energy = light.energy


func _process(_delta: float) -> void:
	if light.enabled:
		light.energy = default_energy + (randf() * 0.2)