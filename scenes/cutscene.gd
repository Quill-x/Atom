extends Node2D


func _on_video_stream_player_finished():
	Global.nextScene = "res://scenes/level.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")
