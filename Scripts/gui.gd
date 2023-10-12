extends CanvasLayer

func _process(delta):
	%Score.text = "Score: " + str(GLOBAL.score)
	%Credits.text = "Credits: " str(GLOBAL.credits)
