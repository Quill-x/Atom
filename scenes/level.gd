extends Node2D

const ENEMY_SPAWN_TIMER = .5


var scene = preload("res://scenes/placeholder_enemy.tscn")
var instance = scene.instantiate()

var spawn_timer = ENEMY_SPAWN_TIMER

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		add_child(instance)
		instance = scene.instantiate()
		spawn_timer = ENEMY_SPAWN_TIMER
