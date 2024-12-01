extends AnimatedSprite2D

var x = position.x
var y = position.y
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = x+RandomNumberGenerator.new().randf_range(-4,4)
	position.y = y+RandomNumberGenerator.new().randf_range(-4,4)
