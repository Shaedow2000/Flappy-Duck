class_name GameOverHUD
extends CanvasLayer

@export var player: Player

var can_restart: bool = false

func _ready() -> void:
	hide()
	
func show_gameover() -> void:
	$Timer.start()
	show()

func _input(event: InputEvent) -> void:
	if not player.gameover:
		return
	
	if (event is InputEventKey or event is InputEventMouseButton) and can_restart:
		get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	can_restart = true
