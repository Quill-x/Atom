extends CharacterBody2D

var electronScene = preload("res://scenes/electron.tscn")
var electronInstance = null
var nucleusScene = preload("res://scenes/sine_nucleus.tscn")
var nucleusInstance = null

func _ready():
	position.y = RandomNumberGenerator.new().randf_range(-550, 500)
	position.x = RandomNumberGenerator.new().randf_range(-300, 300)

func _physics_process(delta):
	if !$AnimationPlayer.is_playing():
		if electronInstance == null:
			electronInstance = electronScene.instantiate()
			electronInstance.position = position
			get_tree().root.add_child(electronInstance)
			electronInstance = null
		if nucleusInstance == null:
			nucleusInstance = nucleusScene.instantiate()
			nucleusInstance.position = position
			get_tree().root.add_child(nucleusInstance)
			nucleusInstance = null
			queue_free()
