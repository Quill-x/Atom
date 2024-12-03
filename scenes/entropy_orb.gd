extends CharacterBody2D

const SPEED = 5

var gotten_hit = false

func _process(delta):
	position.x -= SPEED
	move_and_slide()


func _on_area_2d_area_entered(area):
	
	Global.entropy += 1
	if gotten_hit == true:
		if !$Ping.playing:
			queue_free()
	if gotten_hit == false:
		gotten_hit = true
		if Global.entropy <= 5:
			$Ping.stream = ResourceLoader.load("res://audio/ping_" + str(Global.entropy) + ".ogg")
			$Ping.play()
		else:
			$Ping.stream = ResourceLoader.load("res://audio/ping_5.ogg")
			$Ping.play()
		visible = false
