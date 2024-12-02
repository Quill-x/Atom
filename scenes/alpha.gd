extends CharacterBody2D
class_name Alpha

const ROTATION_TIME = .05
const BASE_SPEED = 250.0

var current_y_dir = 1

func _ready():
	position.x = 1012
	position.y = RandomNumberGenerator.new().randf_range(-550, 500)

func bounce():
	current_y_dir = 0-current_y_dir
	$Squish.play("squish")
	
func _physics_process(delta: float) -> void:
	velocity.x = -BASE_SPEED
	velocity.y = BASE_SPEED*2 * current_y_dir
	move_and_slide()
	if position.x <= -1200:
		queue_free()

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().get_hit(position)
