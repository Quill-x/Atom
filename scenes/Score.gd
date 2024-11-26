extends Label

const SCORE_TIME = .4

var score = 0
var score_timer = SCORE_TIME

func decreaseScore(ammount):
	score -= ammount

func _process(delta: float) -> void:
	score_timer -= delta
	if score_timer <= 0:
		score += 1
		score_timer = SCORE_TIME
	text = "Score: " + str(score)
	score = clamp(score,0,INF)
	Global.score = score
