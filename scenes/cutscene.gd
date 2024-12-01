extends Node2D

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "opening":
		$AnimationPlayer.play("scientist")
	elif anim_name == "scientist":
		Global.nextScene = "res://scenes/Level.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
