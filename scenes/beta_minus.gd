extends CharacterBody2D

var electronScene = preload("res://scenes/electron.tscn")
var electronInstance = null
var nucleusScene = preload("res://scenes/sine_nucleus.tscn")
var nucleusInstance = null
var animationPlayed = false

func _ready():
	position.y = RandomNumberGenerator.new().randf_range(-550, 500)
	position.x = RandomNumberGenerator.new().randf_range(-300, 300)

func _physics_process(delta):
	if !$Nucleus/AnimatedSprite2D.is_playing():
		if electronInstance == null:
			electronInstance = electronScene.instantiate()
			electronInstance.position = position
			get_tree().root.add_child(electronInstance)
		
		if nucleusInstance == null and !animationPlayed:
			$Nucleus/AnimatedSprite2D.play("sneeze")
			animationPlayed = true
		if $Nucleus/AnimatedSprite2D.animation == "sneeze" and $Nucleus/AnimatedSprite2D.frame == 4:
			nucleusInstance = nucleusScene.instantiate()
			nucleusInstance.position = position
			get_tree().root.add_child(nucleusInstance)
			nucleusInstance = null
			queue_free()
			
func _on_animated_sprite_2d_animation_finished(anim_name):
	if $Nucleus/AnimatedSprite2D.animation == "sneeze":
		nucleusInstance = nucleusScene.instantiate()
		nucleusInstance.position = position
		get_tree().root.add_child(nucleusInstance)
		nucleusInstance = null
		queue_free()
