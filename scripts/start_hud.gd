class_name StartHUD
extends CanvasLayer

@export var timer: Timer

var can_start: bool = false

func _input(event: InputEvent) -> void:
	if can_start and (event is InputEventKey or event is InputEventMouseButton):
		timer.start()
		can_start = false
		$"../Player".start = true
		queue_free()

func _on_timer_timeout() -> void:
	can_start = true
