extends Control

func _ready() -> void:
	if Global.mobile:
		visible = true
	else:
		visible = false
