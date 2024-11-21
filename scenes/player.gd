extends CharacterBody2D

const MAXSPEED = 700
const ACCELERATION = 500
const FRICTION = 150
var maxspeed = MAXSPEED

func _physics_process(delta: float) -> void:
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

	if abs(velocity.x) > 0 and abs(velocity.y) > 0:
		velocity = velocity.normalized() * maxspeed

	$AnimatedSprite2D.scale.y = 2 - abs(velocity.x / (MAXSPEED * 4)) + abs(velocity.y / (MAXSPEED * 4))
	$AnimatedSprite2D.scale.x = 2 - abs(velocity.y / (MAXSPEED * 4)) + abs(velocity.x / (MAXSPEED * 4))

	move_and_slide()
