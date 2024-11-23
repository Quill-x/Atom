extends CharacterBody2D
class_name Electron

const SPEED = 400
const HOMING_TIME = 300
const ROTATIONAL_SPEED = 100

const CAMERA_X_BOUNDS = 1200
const CAMERA_Y_BOUNDS = 600

var player
var State = "Normal"
var timer = HOMING_TIME
var current_rotation = 0

func _ready():
	velocity.x = -SPEED

func _on_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().get_hit(position)
		queue_free()

func _on_chase_area_entered(area):
	if area.get_parent() is Player:
		State = "Chase"
		player = area.get_parent()
	
func _on_chase_area_exited(area):
	if area.get_parent() is Player:
		State = "Normal"
		timer = 0
		

func _physics_process(delta):
	if State == "Normal":
		pass
	elif State == "Chase" and timer > 0:
		timer -= 1
		velocity = (player.position - position).normalized() * SPEED*1.1
	else:
		State = "Normal"
	if position.x > CAMERA_X_BOUNDS or position.x < -CAMERA_X_BOUNDS or position.y > CAMERA_Y_BOUNDS or position.y < -CAMERA_Y_BOUNDS:
		queue_free()
	move_and_slide()
