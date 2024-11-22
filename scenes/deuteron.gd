extends CharacterBody2D
class_name Deuteron

const ROTATION_TIME = .05
const SPEED = 500.0

var rotation_timer = ROTATION_TIME

func _ready():
	position.x = 1012
	position.y = RandomNumberGenerator.new().randf_range(-500, 500)

func _physics_process(delta: float) -> void:
	rotation_timer -= delta
	velocity.x = -SPEED
	move_and_slide()
	if position.x <= -1200:
		queue_free()
	if rotation_timer <= 0:
		rotation += deg_to_rad(22.5)
		rotation_timer = ROTATION_TIME

func _on_area_entered(area):
	if area.get_parent() is Player:
		print("test")
		area.get_parent().get_hit(position)
