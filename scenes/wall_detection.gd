extends Area2D

func _on_area_entered(area):
	if area.get_parent() is Alpha:
		area.get_parent().bounce()
