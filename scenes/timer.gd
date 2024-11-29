extends Node

var in_game = false
var time = 690
var minutes = 0
var seconds = 0

func _ready():
	pass # Replace with function body.


func _process(delta):
	if in_game:
		time -= delta
		minutes = floor(time/60)
		seconds = fmod(time, 60)
		if time <= 0:
			get_tree().quit()
