extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_pressed("Skip"):
		Global.nextScene = "res://scenes/Level.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
#	if $AnimationPlayer.current_animation == "opening":
#		$AnimationPlayer.current_animation_position = $Music.get_playback_position()
#	if $AnimationPlayer.current_animation == "scientist":
#		$AnimationPlayer.current_animation_position = ($Music.get_playback_position()-13.563)
#	if $AnimationPlayer.current_animation == "atom":
#		$AnimationPlayer.current_animation_position = ($Music.get_playback_position()-(13.563+11.66))


func _on_animation_player_animation_finished(anim_name):

	
	if anim_name == "opening":
		$AnimationPlayer.play("scientist")
	elif anim_name == "scientist":
		$AnimationPlayer.play("atom")
	elif anim_name == "atom":
		Global.nextScene = "res://scenes/Level.tscn"
		get_tree().change_scene_to_file("res://scenes/loading.tscn")
