extends Node2D

var deuteronScene = preload("res://scenes/deuteron.tscn")
var deuteronInstance = deuteronScene.instantiate()
var electronScene = preload("res://scenes/beta_minus.tscn")
var electronInstance = electronScene.instantiate()
var alphaScene = preload("res://scenes/alpha.tscn")
var alphaInstance = alphaScene.instantiate()
var spawn_timer = 1

func _process(delta):
	spawn_timer -= delta
	#if spawn_timer <= 0:
	#	if enemy == 0 or enemy == 1 or enemy == 2 or enemy == 3 or enemy == 4:
	#		add_child(deuteronInstance)
	#		deuteronInstance = deuteronScene.instantiate()
	#		spawn_timer = RandomNumberGenerator.new().randf_range(0.01, .8)
	#	if enemy >= 6:
	#		add_child(electronInstance)
	#		electronInstance = electronScene.instantiate()
	#		spawn_timer = RandomNumberGenerator.new().randf_range(1, 3)
	#	if enemy == 5 or enemy == 6:
	#		add_child(alphaInstance)
	#		alphaInstance = alphaScene.instantiate()
	#		spawn_timer = RandomNumberGenerator.new().randf_range(0.01, 1.5)
	
	# Wave 1 is 670-655
	if GlobalTimer.time < 670 and GlobalTimer.time > 665:
		if spawn_timer <= 0:
			add_child(deuteronInstance)
			deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(1, 2)
	#Wave 1 Part 2
	if GlobalTimer.time < 665 and GlobalTimer.time > 655: 
		if spawn_timer <= 0:
			for i in range(2): # They appear in pairs
				add_child(deuteronInstance)
				deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(2, 3)
	#Wave 1 Part 3
	if GlobalTimer.time < 645 and GlobalTimer.time > 630: 
		if spawn_timer <= 0:
			add_child(deuteronInstance)
			deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(.5,.75)
	#Wave 2 is 624-600
	if GlobalTimer.time < 624 and GlobalTimer.time > 611: 
		if spawn_timer <= 0:
			var enemy = randi_range(0,2)
			if enemy == 2:
				add_child(alphaInstance)
				alphaInstance = alphaScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(2, 2.5)
			else:
				add_child(deuteronInstance)
				deuteronInstance = deuteronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(.1,.75)
	#Wave 2 Part 2
	if GlobalTimer.time < 611 and GlobalTimer.time > 600: 
		if spawn_timer <= 0:
			var enemy = randi_range(0,2)
			if enemy == 2:
				add_child(alphaInstance)
				alphaInstance = alphaScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(1, 1.5)
			else:
				add_child(deuteronInstance)
				deuteronInstance = deuteronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(0,.5)
	#Surprise Beta Minus
	if floor(GlobalTimer.time) == 598:
		if spawn_timer <= 0:
			add_child(electronInstance)
			electronInstance = electronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(1, 2)
	#Wave 3 is 590-570
	if GlobalTimer.time < 590 and GlobalTimer.time > 580:
		if spawn_timer <= 0:
			add_child(electronInstance)
			electronInstance = electronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(3, 5)
