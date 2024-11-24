extends Node2D

var deuteronScene = preload("res://scenes/deuteron.tscn")
var deuteronInstance = deuteronScene.instantiate()
var electronScene = preload("res://scenes/beta_minus.tscn")
var electronInstance = electronScene.instantiate()
var alphaScene = preload("res://scenes/alpha.tscn")
var alphaInstance = alphaScene.instantiate()
var spawn_timer = 1

func _process(delta):
	var enemy = randi_range(0,9)
	spawn_timer -= delta
	if spawn_timer <= 0:
		if enemy == 0 or enemy == 1 or enemy == 2 or enemy == 3 or enemy == 4:
			add_child(deuteronInstance)
			deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 1.5)
		if enemy >= 6:
			add_child(electronInstance)
			electronInstance = electronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 2)
		if enemy == 5 or enemy == 6:
			add_child(alphaInstance)
			alphaInstance = alphaScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 2)
