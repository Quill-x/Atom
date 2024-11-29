extends CharacterBody2D
class_name Electron

const SPEED = 200
const HOMING_TIME = 500
const ROTATIONAL_SPEED = 100

const CAMERA_X_BOUNDS = 1200
const CAMERA_Y_BOUNDS = 600

var player
var State = "Normal"
var timer = HOMING_TIME
var current_rotation = 0

func _ready():
	print(position)
	#position.x = 1012
	#position.y = RandomNumberGenerator.new().randf_range(-550, 500)
	velocity.x = -SPEED
	$Magnet.scale.x = 0

func _on_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().get_hit(position)
		queue_free()

func _on_chase_area_entered(area):
	if area.get_parent() is Player:
		State = "Chase"
		player = area.get_parent()
		if timer != 0:
			$Magnet/AnimationPlayer.play("appear")
	
func _on_chase_area_exited(area):
	if area.get_parent() is Player:
		State = "Normal"
		#timer = 0
		

func _physics_process(delta):
	Engine.set_physics_ticks_per_second(DisplayServer.screen_get_refresh_rate())
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
