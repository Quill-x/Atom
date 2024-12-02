extends Node2D

var deuteronScene = preload("res://scenes/deuteron.tscn")
var deuteronInstance = deuteronScene.instantiate()
var electronScene = preload("res://scenes/beta_minus.tscn")
var electronInstance = electronScene.instantiate()
var alphaScene = preload("res://scenes/alpha.tscn")
var alphaInstance = alphaScene.instantiate()
var spawn_timer = 1

func _ready():
	GlobalTimer.in_game = true
	Global.wave = 0

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
	
	# Wave 1
	if GlobalTimer.time < 670-GlobalTimer.timer_subtract and GlobalTimer.time > 665-GlobalTimer.timer_subtract:
		Global.wave = 1
		if spawn_timer <= 0:
			add_child(deuteronInstance)
			deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(1, 2)
	#Wave 2
	if GlobalTimer.time < 665-GlobalTimer.timer_subtract and GlobalTimer.time > 655-GlobalTimer.timer_subtract: 
		Global.wave = 2
		if spawn_timer <= 0:
			for i in range(2): # They appear in pairs
				add_child(deuteronInstance)
				deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(2, 3)
	#Wave 3
	if GlobalTimer.time < 645-GlobalTimer.timer_subtract and GlobalTimer.time > 630-GlobalTimer.timer_subtract: 
		Global.wave = 3
		if spawn_timer <= 0:
			add_child(deuteronInstance)
			deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(.5,.75)
	#Wave 4
	if GlobalTimer.time < 624-GlobalTimer.timer_subtract and GlobalTimer.time > 611-GlobalTimer.timer_subtract: 
		Global.wave = 4
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
	#Wave 5
	if GlobalTimer.time < 611-GlobalTimer.timer_subtract and GlobalTimer.time > 600-GlobalTimer.timer_subtract: 
		Global.wave = 5
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
	if floor(GlobalTimer.time) == 598-GlobalTimer.timer_subtract:
		Global.wave = 6
		if spawn_timer <= 0:
			add_child(electronInstance)
			electronInstance = electronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(1, 2)
	#Wave 7
	if GlobalTimer.time < 588-GlobalTimer.timer_subtract and GlobalTimer.time > 580-GlobalTimer.timer_subtract:
		Global.wave = 7
		if spawn_timer <= 0:
			add_child(electronInstance)
			electronInstance = electronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(3, 5)
	#Wave Final
	if GlobalTimer.time < 60 and GlobalTimer.time > 15: 
		Global.wave = 99
		if spawn_timer <= 0:
			var enemy = randi_range(0,4)
			if enemy == 2:
				enemy = RandomNumberGenerator.new().randi_range(0,2)
				if enemy == 1:
					add_child(electronInstance)
					electronInstance = electronScene.instantiate()
					spawn_timer = RandomNumberGenerator.new().randf_range(.2,.4)
			elif enemy == 0 or enemy == 4:
				for i in range(RandomNumberGenerator.new().randi_range(1,3)):
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
				spawn_timer = .4
			elif enemy == 1:
				for i in range(RandomNumberGenerator.new().randi_range(1,7)):
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
				spawn_timer = .7
			elif enemy == 3:
				enemy = RandomNumberGenerator.new().randi_range(0,1)
				if enemy == 1:
					add_child(alphaInstance)
					alphaInstance = alphaScene.instantiate()
					spawn_timer = RandomNumberGenerator.new().randf_range(.1,.6)
	#Wave 8
	if GlobalTimer.time < 580-GlobalTimer.timer_subtract and GlobalTimer.time > 560-GlobalTimer.timer_subtract: 
		Global.wave = 8
		if spawn_timer <= 0:
			var enemy = randi_range(0,5)
			if enemy == 2:
				add_child(electronInstance)
				electronInstance = electronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(2, 2.2)
			elif enemy == 1 or enemy == 0 or enemy == 3:
				for i in range(2): # They appear in pairs
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(1,1.5)
	#Wave 9
	if GlobalTimer.time < 548-GlobalTimer.timer_subtract and GlobalTimer.time > 525-GlobalTimer.timer_subtract: 
		Global.wave = 9
		if spawn_timer <= 0:
			for i in range(2): # They appear in pairs
				add_child(deuteronInstance)
				deuteronInstance = deuteronScene.instantiate()
			spawn_timer = RandomNumberGenerator.new().randf_range(0.4,0.75)
	#Wave 10
	if GlobalTimer.time < 518-GlobalTimer.timer_subtract and GlobalTimer.time > 490-GlobalTimer.timer_subtract: 
		Global.wave = 10
		if spawn_timer <= 0:
			var enemy = randi_range(0,12)
			if enemy == 0:
				add_child(alphaInstance)
				alphaInstance = alphaScene.instantiate()
				spawn_timer = 0
			else: 
				for i in range(3): # They appear in triplets
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(0.6,0.75)
	#Wave 11
	if GlobalTimer.time < 490-GlobalTimer.timer_subtract and GlobalTimer.time > 470-GlobalTimer.timer_subtract: 
		Global.wave = 11
		if spawn_timer <= 0:
			var enemy = randi_range(0,12)
			if enemy == 0:
				add_child(alphaInstance)
				alphaInstance = alphaScene.instantiate()
				spawn_timer = 0
			elif enemy == 1 or enemy == 2 or enemy == 3:
				for i in range(3):
					await get_tree().create_timer(.2).timeout
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(1,2)
			else: 
				for i in range(3): # They appear in triplets
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
				spawn_timer = RandomNumberGenerator.new().randf_range(0.6,0.75)
	#Wave 12
	if GlobalTimer.time < 460-GlobalTimer.timer_subtract and GlobalTimer.time > 425-GlobalTimer.timer_subtract: 
		Global.wave = 12
		if spawn_timer <= 0:
			var enemy = RandomNumberGenerator.new().randi_range(0,4)
			if enemy == 0 or enemy == 1 or enemy == 3:
				for i in range(2):
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
					spawn_timer = .5
			if enemy == 2 :
				add_child(alphaInstance)
				alphaInstance = alphaScene.instantiate()
				spawn_timer = 1
			if enemy == 4:
				add_child(electronInstance)
				electronInstance = electronScene.instantiate()
				spawn_timer = 2
	#Wave 13
	if GlobalTimer.time < 410-GlobalTimer.timer_subtract and GlobalTimer.time > 380-GlobalTimer.timer_subtract: 
		Global.wave = 13
		if spawn_timer <= 0:
			var enemy = RandomNumberGenerator.new().randi_range(0,4)
			if enemy == 2 or enemy == 1:
				for i in range(2):
					add_child(alphaInstance)
					alphaInstance = alphaScene.instantiate()
					spawn_timer = 2
			if enemy == 4:
				add_child(electronInstance)
				electronInstance = electronScene.instantiate()
				spawn_timer = 1
	#Wave 14
	if GlobalTimer.time < 380-GlobalTimer.timer_subtract and GlobalTimer.time > 343-GlobalTimer.timer_subtract: 
		Global.wave = 14
		if spawn_timer <= 0:
			var enemy = RandomNumberGenerator.new().randi_range(0,5)
			if enemy == 3 or enemy == 5:
				for i in range(5):
					add_child(deuteronInstance)
					deuteronInstance = deuteronScene.instantiate()
					spawn_timer = 1
			if enemy == 2 or enemy == 1:
				for i in range(2):
					add_child(alphaInstance)
					alphaInstance = alphaScene.instantiate()
					spawn_timer = 2
			if enemy == 4:
				add_child(electronInstance)
				electronInstance = electronScene.instantiate()
				spawn_timer = 1
