extends CharacterBody2D
class_name Deuteron

const ROTATION_TIME = .05
const BASE_SPEED = 200.0
const SPEED_INCREASE = 1.0087 # WAS THAT THE

var speed = BASE_SPEED
var rotation_timer = ROTATION_TIME

func _ready():
	position.x = 1012
	if GlobalTimer.time < 670 - GlobalTimer.timer_subtract and GlobalTimer.time > 665 - GlobalTimer.timer_subtract:
		if RandomNumberGenerator.new().randi_range(0,1) == 0:
			position.y = Global.player_y
		else:
			position.y = RandomNumberGenerator.new().randf_range(-550, 500)
	else:
		position.y = RandomNumberGenerator.new().randf_range(-550, 500)

	$Base.rotation = deg_to_rad(RandomNumberGenerator.new().randi_range(1,2) * 180)

func _physics_process(delta: float) -> void:
	if GlobalTimer.game_done:
		queue_free()
	rotation_timer -= delta
	speed *= SPEED_INCREASE
	velocity.x = -speed
	move_and_slide()
	if position.x <= -1200:
		queue_free()
	if rotation_timer <= 0:
		#$Base.rotation += deg_to_rad(22.5)
		rotation_timer = ROTATION_TIME

func _on_area_entered(area):
	if area.get_parent() is Player:
		print("test")
		area.get_parent().get_hit(position)
