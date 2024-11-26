extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 5
	if fmod(position.x,3000) == 0:
		position.x += 3000
