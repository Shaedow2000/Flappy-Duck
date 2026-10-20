extends Node2D

var SPEED: float = 100

func _ready() -> void:
	position.y = randf_range(30, 60)

func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	
func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.call("die")

func _on_top_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.call("die")

func _on_scoring_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.call("increment_score")
		
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
