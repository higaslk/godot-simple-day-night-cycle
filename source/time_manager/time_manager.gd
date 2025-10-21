## Class name TimeManager. Autoloading
extends Node

@export var paused: bool = false
@export var day_speed: int = 60
@export_range(0,23) var starting_hour: int = 6

var total_elapsed_time: float = 0.0

var current_time: String
var last_time: String

signal time_changed(time: String)

func _ready() -> void:
    total_elapsed_time = (starting_hour / 24.0) * day_speed


func _process(delta: float) -> void:
    if paused: return
    total_elapsed_time += delta

    var time: float = get_hour_time()
    if time > 6 and time < 18:
        current_time = 'day'
    else:
        current_time = 'night'
    
    if current_time != last_time:
        last_time = current_time
        time_changed.emit(current_time)


# Return the seconds in the current cycle.
func get_cycle_time() -> float:
    return fmod(total_elapsed_time, day_speed)


func get_hour_time() -> float:
    var seconds = get_cycle_time()
    return (seconds / day_speed) * 24.0