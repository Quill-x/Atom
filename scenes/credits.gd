extends Sprite2D

var extended = false

func _on_credits_pressed():
	if extended:
		$AnimationPlayer.play("leave")
		extended = false
	else:
		$AnimationPlayer.play("enter")
		extended = true
