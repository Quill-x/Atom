extends Label

func _process(delta):
	if GlobalTimer.seconds <= 10:
		text = 'Time Left: ' + str(GlobalTimer.minutes) + ":0" + str(floor(GlobalTimer.seconds))
	else:
		text = 'Time Left: ' + str(GlobalTimer.minutes) + ":" + str(floor(GlobalTimer.seconds))
