extends Sprite2D

var frameCounter = 0
var isAlreadyDisplayingText = false

var text_state = "Normal"
var silent_characters = [".", "?", "!", ","," "]

func display_text(text,time,continuable):
	isAlreadyDisplayingText = true
	$SpeechBubble/Label.text = ""
	$Seaborg.play("default")
	for i in range(len(text)):
		$SpeechBubble/Label.text += text[i]
		if !text[i] in silent_characters:
			$AudioStreamPlayer.pitch_scale = RandomNumberGenerator.new().randf_range(0.97, 1.03)
			$AudioStreamPlayer.play()
		else:
			if !text[i] == " ":
				await get_tree().create_timer(.1).timeout
		await get_tree().create_timer(.03).timeout
	$Seaborg.frame = 0
	$Seaborg.stop()
	await get_tree().create_timer(time).timeout
	isAlreadyDisplayingText = false
	if !continuable:
		$Seaborg/AnimationPlayer.play("Disappear")

func _process(delta):
	if floor(GlobalTimer.time) == 689:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if isAlreadyDisplayingText == false:
			display_text("Okay, sensors
calibrated,
vaccum prepared,
and beam target
locked. We
are clear to
boot up the
accelerator.",1,true)
	if floor(GlobalTimer.time) ==  682:
		if !isAlreadyDisplayingText:
			text_state = "Shaky"
			display_text("LAWRENCE,
START THE
DEUTRON FLOW!
LETS GET THIS
CYCLOTRON UP
AND RUNNIN'!!!",3,false)
	if floor(GlobalTimer.time) == 675:
		$Tutorial/AnimationPlayer.play("tutorial")
		
	if floor(GlobalTimer.time) ==  652:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("Lawrence, is 
something wrong?
Theres barely
anything in the
beam! At this
rate we won't
create anything.
Ramp the flow
up a notch!",3,false)
	if floor(GlobalTimer.time) ==  627:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("The accelerator
should be clear
for launching
alpha particles
now. Lawrence,
you know what
to do!",3,false)
	if floor(GlobalTimer.time) ==  592:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			$Alert/AnimationPlayer.play("appear")
			display_text("Eureka! We
managed to hit
something!
But the wrong
thing... We
need to hit the
target nucleus
in order to
create these
new elements... ",6,false)

	if text_state == "Shaky" and isAlreadyDisplayingText:
		$SpeechBubble/Label.position.x = RandomNumberGenerator.new().randi_range(-1,1)-54
		$SpeechBubble/Label.position.y = RandomNumberGenerator.new().randi_range(-1,1)-115
	if text_state == "Normal" and isAlreadyDisplayingText:
		$SpeechBubble/Label.position.x = -54
		$SpeechBubble/Label.position.y = -115
