extends CharacterBody2D
class_name Sine_Nucleus

const MAX_SPEED = 400.0
const ACCELERATION = 2

var sineTime = 0

func _physics_process(delta):
	if position.x <= -1200:
		queue_free()
	velocity.y = -sin(sineTime)*100
	sineTime += .05
	velocity.x -= ACCELERATION
	velocity.x = clamp(velocity.x,-MAX_SPEED,INF)
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().get_hit(position)
