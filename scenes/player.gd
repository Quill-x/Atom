extends CharacterBody2D
class_name Player

const MAXSPEED = 700
const ACCELERATION = 500
const FRICTION = 150
const HIT_VELOCITY = 3000
const HIT_SLOWDOWN_RATE = 0.9 
const DASH_SPEED = 4200
const MAX_DASH_TIME = 12
const DASH_COOLDOWN_TIME = 20

var score = 0
var rotational_velocity = 0
var maxspeed = MAXSPEED
var state = "Normal"
var damagedScene = preload("res://scenes/damage_indicator.tscn")
var damagedInstance = null
var dash_timer = 0
var dash_direction = 0
var dash_cooldown = 0

var particleScene = preload("res://scenes/dash_particle.tscn")
var particleInstance = particleScene.instantiate()

func get_hit(pos):
	if !state == "Dash":
		Global.times_hit += 1
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
	$Eyes.position.x = clamp(velocity.x/(maxspeed/4),-4,4)
	$Eyes.position.y = clamp(velocity.y/(maxspeed/6),-6,6)
	Global.player_x = $AnimatedSprite2D.position.x
	Global.player_y = $AnimatedSprite2D.position.y
	
	if state == "Normal":
		dash_cooldown -= 1
		if Input.is_action_pressed("Left"):
			velocity.x -= ACCELERATION
		if Input.is_action_pressed("Right"):
			velocity.x += ACCELERATION
		if Input.is_action_pressed("Up"):
			velocity.y -= ACCELERATION
		if Input.is_action_pressed("Down"):
			velocity.y += ACCELERATION

		
		var direction_x = 0
		var direction_y = 0
		
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
		
		if Input.is_action_just_pressed("Dash") and Global.entropy >= 5 and dash_cooldown <= 0:
			state = "Dash"
			Global.entropy -= 5
			dash_direction = velocity
			if velocity.length() == 0:
				velocity.x = maxspeed
			velocity.x = clamp((velocity.normalized().x * DASH_SPEED),-DASH_SPEED,DASH_SPEED)
			velocity.y = clamp((velocity.normalized().y * DASH_SPEED),-DASH_SPEED,DASH_SPEED)
			dash_timer = MAX_DASH_TIME
			
		$AnimatedSprite2D.animation = "idle"
	elif state == "Hit":
		velocity *= HIT_SLOWDOWN_RATE
		#$AnimatedSprite2D.animation = "hit"
	elif state == "Dash":
		if Input.is_action_pressed("Left"):
			velocity.x -= ACCELERATION/2
		if Input.is_action_pressed("Right"):
			velocity.x += ACCELERATION/2
		if Input.is_action_pressed("Up"):
			velocity.y -= ACCELERATION/2
		if Input.is_action_pressed("Down"):
			velocity.y += ACCELERATION/2
		velocity *= .82
		$Eyes.visible = false
		dash_timer -= 1
		$AnimatedSprite2D.animation = "dash"
		if velocity.length() > DASH_SPEED:
			velocity = velocity.normalized() * DASH_SPEED
		
		particleInstance = particleScene.instantiate()
		add_child(particleInstance)
		
	
	rotation += rotational_velocity
	
	if state != "Dash":
		$Eyes.visible = true
		$AnimatedSprite2D.scale.y = 2 - abs(velocity.x / (MAXSPEED * 4)) + abs(velocity.y / (MAXSPEED * 5))
		$AnimatedSprite2D.scale.x = 2 - abs(velocity.y / (MAXSPEED * 4)) + abs(velocity.x / (MAXSPEED * 8))
	if dash_timer == 0 and state == "Dash":
			dash_cooldown = DASH_COOLDOWN_TIME
			state = "Normal"
	move_and_slide()
