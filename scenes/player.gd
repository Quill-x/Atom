extends CharacterBody2D
class_name Player

const MAXSPEED = 700
const ACCELERATION = 500
const FRICTION = 150
const HIT_VELOCITY = 3000
const HIT_SLOWDOWN_RATE = 0.9 

var score = 0
var rotational_velocity = 0
var maxspeed = MAXSPEED
var state = "Normal"
var damagedScene = preload("res://scenes/damage_indicator.tscn")
var damagedInstance = null

func get_hit(pos):
	state = "Hit"
	velocity.x = 0
	velocity.y = 0
	
	$Hit.pitch_scale = RandomNumberGenerator.new().randf_range(0.7, .9)
	print($Hit.pitch_scale)
	$Hit.play()
	
	$ScoreLabel.decreaseScore(5)
	
	damagedInstance = damagedScene.instantiate()
	damagedInstance.position = position
	get_tree().root.add_child(damagedInstance)
	
	var direction = (position - pos).normalized()
	velocity = direction * HIT_VELOCITY
	rotational_velocity = 200
	
	var timer = await get_tree().create_timer(0.2).timeout
	state = "Normal"
	
	rotational_velocity = 0
	rotation = 0

func _physics_process(delta: float) -> void:
	Global.player_x = position.x
	Global.player_y = position.y
	if state == "Normal":
		if Input.is_action_pressed("Left"):
			velocity.x -= ACCELERATION
		if Input.is_action_pressed("Right"):
			velocity.x += ACCELERATION
		if Input.is_action_pressed("Up"):
			velocity.y -= ACCELERATION
		if Input.is_action_pressed("Down"):
			velocity.y += ACCELERATION

		var direction_x = Input.get_axis("Left", "Right")
		var direction_y = Input.get_axis("Up", "Down")
		
		if direction_x != 0:
			var speed_factor_x = 1 - abs(velocity.x / maxspeed) + 0.2
			velocity.x += direction_x * ACCELERATION * speed_factor_x
		else:
			if abs(velocity.x) > FRICTION:
				velocity.x -= sign(velocity.x) * FRICTION
			else:
				velocity.x = 0

		if direction_y != 0:
			var speed_factor_y = 1 - abs(velocity.y / maxspeed) + 0.2
			velocity.y += direction_y * ACCELERATION * speed_factor_y
		else:
			if abs(velocity.y) > FRICTION:
				velocity.y -= sign(velocity.y) * FRICTION
			else:
				velocity.y = 0

		if Input.is_action_pressed("Slow"):
			maxspeed = MAXSPEED / 2
		else:
			maxspeed = MAXSPEED

		if velocity.length() > maxspeed:
			velocity = velocity.normalized() * maxspeed
	
		$AnimatedSprite2D.animation = "idle"
	elif state == "Hit":
		velocity *= HIT_SLOWDOWN_RATE
		#$AnimatedSprite2D.animation = "hit"
	$AnimatedSprite2D.scale.y = 2 - abs(velocity.x / (MAXSPEED * 4)) + abs(velocity.y / (MAXSPEED * 5))
	$AnimatedSprite2D.scale.x = 2 - abs(velocity.y / (MAXSPEED * 4)) + abs(velocity.x / (MAXSPEED * 8))
	rotation += rotational_velocity
	
	move_and_slide()
