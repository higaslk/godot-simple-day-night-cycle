class_name LightSource
extends PointLight2D

@export var synced_with_time: bool = false

var default_energy = energy

func _ready() -> void:
    if synced_with_time:
        TimeManager.time_changed.connect(on_time_changed)


func on_time_changed(time: String) -> void:
    if time == 'day':
        var tween: Tween = create_tween()
        tween.tween_property(self, "energy", 0.0, 2.0)

        await tween.finished
        enabled = false
    else:
        var tween: Tween = create_tween()
        tween.tween_property(self, "energy", default_energy, 2.0)

        enabled = true
        