extends CharacterBody2D
class_name Enemy

const SPEED = 200.0

func _physics_process(delta: float) -> void:
	velocity.x = -SPEED
	move_and_slide()


func _on_area_entered(area):
	if area.get_parent() is Player:
		print("test")
		area.get_parent().get_hit(position)
