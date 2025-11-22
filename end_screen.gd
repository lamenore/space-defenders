extends SubViewportContainer

func _ready():
	Score.load_high_score()
	$SubViewport/txtScore.text = "Score:\n" + str(Score.score)
	$SubViewport/txtHighScore.text = "High Score:\n" + str(Score.high_score)

func _on_btn_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://inicialscreen/inicial_screen.tscn")

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
