extends Sprite2D
@onready var loopTime = 2000
@onready var i = loopTime

func _ready():	
	position.x = 0
	$Grid2.position.x = 0
	position.y = 0
	$Grid2.position.y = 0

func _physics_process(delta):
	$Grid2.position.x += sqrt(80000)/loopTime #200^2 + 200^2 = 80000
	$Grid2.position.y -= sqrt(80000)/loopTime
	position.x -= sqrt(80000)/loopTime #200^2 + 200^2 = 80000
	position.y -= sqrt(80000)/loopTime
