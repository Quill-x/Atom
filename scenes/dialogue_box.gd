extends Sprite2D

var frameCounter = 0
var isAlreadyDisplayingText = false

var text_state = "Normal"
var silent_characters = [".", "?", "!", ","," "]

func _ready():
	$Seaborg.visible = true
	$AudioStreamPlayer.volume_db = -15

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
	if floor(GlobalTimer.time) == 689 - GlobalTimer.timer_subtract:
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
	if floor(GlobalTimer.time) ==  682 - GlobalTimer.timer_subtract:
		if !isAlreadyDisplayingText:
			text_state = "Shaky"
			display_text("LAWRENCE,
START THE
DEUTRON FLOW!
LETS GET THIS
CYCLOTRON UP
AND RUNNIN'!!!",4.5,false)
	if floor(GlobalTimer.time) == 675 - GlobalTimer.timer_subtract:
		$Tutorial/AnimationPlayer.play("tutorial")
		
	if floor(GlobalTimer.time) ==  652 - GlobalTimer.timer_subtract:
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
	if floor(GlobalTimer.time) ==  627 - GlobalTimer.timer_subtract:
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
	if floor(GlobalTimer.time) ==  592 - GlobalTimer.timer_subtract:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			$Alert/AnimationPlayer.play("appear")
			display_text("Finally! We
managed to hit
something!
But the wrong
thing... We
have to hit the
target nucleus
in order to
create these
new elements... ",6,false)
	if floor(GlobalTimer.time) ==  560 - GlobalTimer.timer_subtract:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("What the...
I'm looking at
the data, is
our target
somehow moving
out of the way
of our
particles?",1,true)
	if floor(GlobalTimer.time) ==  552 - GlobalTimer.timer_subtract:
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("Hey nucleus,
can you get hit
by the nuclei
pretty please?
We don't have
much time left
before another
team of re-
searchers has
to use this
accelerator...",4,false)
	if floor(GlobalTimer.time) ==  525 - GlobalTimer.timer_subtract:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("Hey Lawrence,
we might have
to turn this
accelerator's
flow higher 
than the level
that its
supposed to
be...",3,false)
	if floor(GlobalTimer.time) ==  468 - GlobalTimer.timer_subtract:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("Oh come on!!!
Lawrence, we
NEED to start
sending all
that we got if 
we want to
create a new
element in
time!",3,false)
	if floor(GlobalTimer.time) ==  420 - GlobalTimer.timer_subtract:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("It would be easy
they said.
It's only one
barn they said.
Heck, the unit
even came from
the phrase:
\"Couldn't hit 
the broad side
of a barn\"!
Haha...",1,true)
	if floor(GlobalTimer.time) ==  412 - GlobalTimer.timer_subtract:
		if !isAlreadyDisplayingText:
			text_state = "Shaky"
			display_text("HahaHAHA HA HA!
WE ARE RUNNING
OUT OF TIME
SO PLEASE FOR
THE LOVE OF GOD
JUST. GET. HIT.
ALREADY.",3,false)
	if floor(GlobalTimer.time) ==  338 - GlobalTimer.timer_subtract:
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("Hahaha...
I've had enough!
Lawrence,
release The
Kraken.
Hopefully we can
get some sort
of interaction 
in this time!",3,false)
	if floor(GlobalTimer.time) ==  277 - GlobalTimer.timer_subtract:
		$AudioStreamPlayer.volume_db = -999
		$Seaborg.visible = false
		$SpeechBubble/Label.text = ""
		$Seaborg/AnimationPlayer.play("Appear")
		await get_tree().create_timer(1.5).timeout
		if !isAlreadyDisplayingText:
			text_state = "Normal"
			display_text("Congratulations!
You made it
through this
bullet hell
experience!
Stats:
Times Hit: " + str(Global.times_hit) + "
Thanks for
playing!",10,false)
	if text_state == "Shaky" and isAlreadyDisplayingText:
		$SpeechBubble/Label.position.x = RandomNumberGenerator.new().randi_range(-1,1)-54
		$SpeechBubble/Label.position.y = RandomNumberGenerator.new().randi_range(-1,1)-115
	if text_state == "Normal" and isAlreadyDisplayingText:
		$SpeechBubble/Label.position.x = -54
		$SpeechBubble/Label.position.y = -115
