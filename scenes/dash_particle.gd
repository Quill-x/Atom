extends AnimatedSprite2D

var oldPosition = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self_modulate.a -= .1
	if self_modulate.a <= 0:
		queue_free
