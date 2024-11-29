extends Label

func _physics_process(delta):
	text = "Wave: " + str(Global.wave)
