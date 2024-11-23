extends Node2D

var deuteronScene = preload("res://scenes/deuteron.tscn")
var deuteronInstance = deuteronScene.instantiate()
var electronScene = preload("res://scenes/electron.tscn")
var electronInstance = electronScene.instantiate()
var spawn_timer = 1

func _process(delta):
	var enemy = randi_range(0,2)
	print(enemy)
	spawn_timer -= delta
	if spawn_timer <= 0:
		if enemy == 0 or enemy == 1:
			add_child(deuteronInstance)
			deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 1.5)
		if enemy == 2:
			add_child(electronInstance)
			electronInstance = electronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 1.5)
