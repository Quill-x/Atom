extends Sprite2D

var frameCounter = 0
var isAlreadyDisplayingText = false

func display_text(text,time):
	isAlreadyDisplayingText = true
	$SpeechBubble/Label.text = ""
	$Seaborg.play("default")
	for i in range(len(text)):
		$SpeechBubble/Label.text += text[i]
		$AudioStreamPlayer.play()
		await get_tree().create_timer(.04).timeout
	$Seaborg.frame = 0
	$Seaborg.stop()
	await get_tree().create_timer(time).timeout
	$Seaborg/AnimationPlayer.play("Disappear")

func _process(delta):
	if floor(GlobalTimer.time) == 688:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if isAlreadyDisplayingText == false:
			display_text("Supah Dupah
Ultra Cool Test
Message",3)
