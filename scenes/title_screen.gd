extends Node2D

func _on_play_button_pressed():
	Global.nextScene = "res://scenes/cutscene.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")
