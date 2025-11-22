extends CanvasLayer

func _process(_delta):
	$txtScore.text = str(Score.score)
