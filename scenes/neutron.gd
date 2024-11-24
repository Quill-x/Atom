extends CharacterBody2D
class_name Beta_Minus

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		print("test")
		area.get_parent().get_hit(position)
