extends Node2D

@export var pipe_pair: PackedScene
@export var pipes: Node2D

func _on_timer_timeout() -> void:
	var pipe: Node2D = pipe_pair.instantiate() as Node2D
	pipes.add_child(pipe)
