extends CharacterBody2D
class_name Enemy

const SPEED = 500.0

func _ready():
	position.x = 1012
	position.y = RandomNumberGenerator.new().randf_range(-500, 500)

func _physics_process(delta: float) -> void:
	velocity.x = -SPEED
	move_and_slide()
	if position.x <= -1200:
		queue_free()

func _on_area_entered(area):
	if area.get_parent() is Player:
		print("test")
		area.get_parent().get_hit(position)
