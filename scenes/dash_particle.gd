extends AnimatedSprite2D

var oldPosition = Vector2(0,0)

func _ready():
	position = Vector2(Global.player_x,Global.player_y)
func _process(delta: float) -> void:
	print(position,Vector2(Global.player_x,Global.player_y))
	self_modulate.a = (self_modulate.a * .9) -.02
	if self_modulate.a <= 0:
		queue_free
