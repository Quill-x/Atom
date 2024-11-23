extends Node2D

var ENEMY_SPAWN_TIMER = .5


var scene = preload("res://scenes/deuteron.tscn")
var instance = scene.instantiate()

var spawn_timer = ENEMY_SPAWN_TIMER

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		add_child(instance)
		instance = scene.instantiate()
		spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 1.5)
