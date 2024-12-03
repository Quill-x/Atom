extends Node2D

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "opening":
		$AnimationPlayer.play("scientist")
	elif anim_name == "scientist":
		$AnimationPlayer.play("atom")
	elif anim_name == "atom":
		Global.nextScene = "res://scenes/Level.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")

func _process(delta):
	if Input.is_action_just_pressed("Skip"):
		Global.nextScene = "res://scenes/Level.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
