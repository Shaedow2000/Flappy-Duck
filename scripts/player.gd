class_name Player
extends CharacterBody2D

const JUMP_VELOCITY: float = -250.0
const DEATH_JUMP_VELOCITY: float = -300
const ROTATION_SPEED: float = 4

var score: int = 0

@export var game_over_hud: GameOverHUD
@export var score_hud: ScoreHUD

@export var gameover: bool = false
@export var start: bool = false

func _ready() -> void:
	add_to_group("Player")
	$DeadBody.hide()

func _physics_process(delta: float) -> void:
	if not start:
		return

	if not is_on_floor():
		velocity += get_gravity() * 0.65 * delta

	if gameover:
		$DeadBody.rotation = rotate_toward($DeadBody.rotation, PI, ROTATION_SPEED * delta)

	if Input.is_action_just_pressed("jump") and not gameover:
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()
	
func die() -> void:
	if not gameover:
		velocity.y = DEATH_JUMP_VELOCITY
		velocity.x = 50
		
		game_over_hud.show_gameover()
		
		$CollisionShape2D.set_deferred("disabled", true)
		$AliveDuck.hide()
		$DeadBody.show()
		
	gameover = true
	
func increment_score() -> void:
	score += 1
	score_hud.change_score(score)
